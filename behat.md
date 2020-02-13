---
title: Testing with Behat
layout: default
---

# Testing with Behat Locally

* If you haven't installed Sauce Connect Proxy on your machine; now is the time to do so. See **Installing Sauce Connect Proxy** below.

## Prep Your Project for Behat Tests (a One Time Setup)

1. **Install behat dependencies** `composer install` <br />
   In behat folder (/profiles/express/tests/behat):  

1. **Start Lando** <br />
   `lando start` <br />
   You need the Lando container for the rest of this.

1. **Install Behat test module**  <br />
   `lando drush en cu_behat_tests -y` <br/>
   This module enables all the bundles and installs local users. Go stretch your legs while it all installs.

   Note: We'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.

1. **Put site in Mixed Mode**<br />
   `lando drush php-eval "variable_set('ldap_authentication_conf', array('authenticationMode' => 1));"` <br />
   So our precious local users can login to the site. <br />
   (in the browser: (admin/config/people/ldap/authentication)

1. **Duplicate behat.local.yml to my.behat.local.yml and update it with local environmental variables (i.e. server URL and access info)**
   Be in project root. <br />
   `cp ../my.behat.local.yml profiles/express/tests/behat`
   You'll use my.behat.local.yml to run local tests. It is GitIgnored. <br />
   `lando info` to verify your local server URL (`http://mySiteName.lndo.site`)<br />
   In behat folder (/profiles/express/tests/behat), edit my.behat.local.yml file and replace:

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

      You'll need to add the Environmental Variables username and access key to the session called 'sauce'. (Get these from a team member.)
      ``` yml
      sauce:
        sauce_labs:
          username: USER-NAME
          access_key: ACCESS-KEY
          connect: true
      ```
Your project is now ready to run the automated tests.

## Running the Behat Tests

### Start the Servers

1. **Start Sauce Proxy Server** <br />
   cd to {sauce-labs-proxy-folder} and run `bin/sc -u USER-NAME -k ACCESS-KEY` (Same info as in my.behat.local.yml; get from a team member)<br />

1. **Stop and Start Lando** <br />
   If you forgot to Cntl-C the server last night, you'll have to force it to quit by stopping and starting Lando. Otherwise the next command may have trouble. <br />
   `lando stop` <br />
   `lando start`

1. **Start webserver** <br />
   From project root: <br />
   `lando drush runserver 127.0.0.1:8079`

### Run the Tests

1. **Run the tests** <br />
   From behat folder (/profiles/express/tests/behat), run behat command.  <br />
   The basic command is <br />
   `./bin/behat --config my.behat.local.yml` <br />
   `./bin/behat --config my.behat.local.yml --verbose --strict --stop-on-failure --tags '@runThisTag'` <br />

   Add other parameters as necessary: <br />
   ```sh
   --verbose
   --strict
   --stop-on-failure
   --tags '@runThisTag'
   ```

   Tags: specify desired tag(s) either as parameters in the command or in my.behat.local.yml <br />
   Behat will run the goutte tests first, then will come back and run those tagged with `@javascript`

1. **Login to Sauce Connect website to view JS tests**<br />
   [Login to Sauce Connect Tunnel](https://app.saucelabs.com/login) should you need to review what's going on with JavaScript. The login credentials are shared with the team via LastPass.


## Troubleshooting

* If too many failed login attempts, empty the flood table.
```sh
lando mysql
-> use drupal7;
-> delete from flood;
-> exit;
```
* Log everybody out <br />
`lando drush sqlq "TRUNCATE sessions"`

### Deleting content

Content must be deleted before tests can be re-run.

Delete nodes:
Install and enable Drupal module 'delete-all' in siteName/modules folder. (note: not the Web Express profile modules folder)
`lando drush delete-all` for info
`lando drush delete-all all --reset` sweeps all nodes, revisions and related taxonomy (You'll need to re-create homepage)

Delete blocks:
```sh
lando mysql
-> use drupal7;
-> delete from bean;
-> delete from bean_revision
-> exit;
```




[CU Boulder Express: Notes on setting up Behat for local testing](https://github.com/CuBoulder/express/tree/dev/tests/behat) <br />
[Hosted Selenium Service Can't Connect To Travis](https://github.com/CuBoulder/express/issues/3035)

## Installing Sauce Connect Proxy (One Time Setup)

1. Download and install Sauce Connect Proxy for the JavaScript testing.
   [Get Sauce Connect Proxy](https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy).



[back](./)
