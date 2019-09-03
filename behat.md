---
title: Testing with Behat
layout: default
---

# Testing with Behat Locally

[CU Boulder Express: Notes on setting up Behat for local testing](https://github.com/CuBoulder/express/tree/dev/tests/behat) <br />
[Hosted Selenium Service Can't Connect To Travis](https://github.com/CuBoulder/express/issues/3035)

1. If you haven't installed Sauce Proxy on your machine; now is the time to do so. See **Installing Sauce Labs Proxy** below.

## Prep Your Project for Behat Tests (a One Time Setup)

1. **Install behat dependencies** <br />
   In behat folder (/profiles/express/tests/behat):  `composer install`

1. **Start Lando** `lando start`
   You need the Lando container for the rest of this.

1. **Install Behat test module** <br/>
   To test with Behat, you'll need to enable all the bundles and install local users. <br />
   The cu_behat_tests module accomplishes this. <br/>
   `lando drush en cu_behat_tests -y` <br />

1. **Login to site and put it in Mixed Mode (config >> LDAP >> Tab 4: Authentication)** <br/>
    This allows the local users to login to the site. We'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.

1. **Update behat.local.yml with config info for lando server and environmental variables** <br />
   `lando info` to verify your local server URL (should be http://mySiteName.lndo.site)<br />
   In behat folder (/profiles/express/tests/behat), edit behat.local.yml file and replace:

      ```yml
      extensions:
       Behat\MinkExtension:
        base_url: "http://127.0.0.1:8079/"
      ```

      With your localhost site address:

      ```yml
      extensions:
       Behat\MinkExtension:
        base_url: "http://mySiteName.lndo.site"
      ```

      You'll need to add the Environmental Variables username and access key to the session called 'sauce'. (Get this from a team member.)
      ``` yml
      sauce:
        sauce_labs:
          username: USER-NAME
          access_key: ACCESS-KEY
          connect: true
      ```

## Running the Behat Tests

1. **Start Sauce Proxy Server** <br />
   cd to {sauce-labs-proxy-folder} and run `bin/sc -u USER-NAME -k ACCESS-KEY` (Get this from a team member)<br />

1. **Start webserver** <br />
   `lando drush runserver 127.0.0.1:8079`

1. **Add Environmental Variables to behat.local.yml file** <br />
   The session 'sauce/sauce_labs' must have environmental variables added as children.
   username: xxx
   access_key: 99999999
   connect: true

1. **Run the tests** <br />
   From behat folder (/profiles/express/tests/behat), run behat command.  <br />
   Example: <br />
   `./bin/behat --config behat.local.yml --verbose --tags '~@broken&&~@javascript'` <br />
   `./bin/behat --config behat.local.yml --strict --stop-on-failure --verbose --tags '@layout'`

   Tags: specify desired tag(s) either as parameters in the command or in behat.local.yml <br />
   Behat will run the goutte tests first, then will come back and run those tagged with `@javascript`

1. **Login to Sauce Connect website to view JS tests**<br />
   [Login to Sauce Connect Tunnel](https://app.saucelabs.com/login) should you need to review what's going on. The login credentials are shared with the team via LastPass.


## Troubleshooting

If too many failed login attempts, empty the flood table.
```sh-session
lando mysql
-> use drupal7;
-> delete from flood;
-> exit;
```
Log everybody out
```sh-session
lando drush sqlq "TRUNCATE sessions"
```

## Installing Sauce Labs Proxy (One Time Setup)

1. Download and install Sauce Connect Proxy for the JavaScript test
   [Get Sauce Connect Proxy](https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy).
   The environmental variables user_name and access_key need to be added to behat.local.yml, unless they can be added elsewhere, such as .bash_profile or Lando somewhere)


[back](./)
