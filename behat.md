---
title: Testing with Behat
layout: default
---

# Testing with Behat Locally

Notes on installing a local site and setting up Behat: https://github.com/CuBoulder/express/tree/dev/tests/behat

## Install Behat

To test with Behat, you'll need to enable all the bundles and install local users.

1. **Install behat dependencies** <br />
   In behat folder (/profiles/express/tests/behat): <br />
   `composer install`

1. **Be in root of MySiteName folder and** `start lando`

1. **Install Behat test module** <br/>
   This enables all the bundles and the local users. <br/>
   `lando drush en cu_behat_tests -y`

1. **Login to site and put it in Mixed Mode (config >> LDAP >> Tab 4: Authentication)** <br/>
   You are now able to sign on as developer/developer or any other role. These users are necessary for local Behat testing. We'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.

1. **Update behat.local.yml with config info for lando server** <br />
   `lando info` to verify your local server URL (should be http://mySiteName.lndo.site)<br />
   In behat folder (/profiles/express/tests/behat), edit behat.local.yml file and replace:

      ```yml
      bash
          extensions:
           Behat\MinkExtension:
            base_url: "http://127.0.0.1:8079/"
      ```

      With your localhost site address:

      ```yml
      bash
          extensions:
           Behat\MinkExtension:
            base_url: "http://mySiteName.lndo.site" # NOT THE SECURE SERVER
      ```
1. **Start webserver** <br />
   `lando drush runserver 127.0.0.1:8079`

1. **Run the Behat tests** <br />
   From behat folder (/profiles/express/tests/behat), run behat command.  <br />
   Example: <br />
   `./bin/behat --config behat.local.yml --verbose --tags '~@broken&&~@javascript'`
   `./bin/behat --config behat.local.yml --strict --stop-on-failure --verbose --tags '@layout'`

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


[back](./)
