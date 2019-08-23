---
title: Testing with Behat
layout: default
---

# Testing with Behat Locally

[CU Boulder Express: Notes on setting up Behat for local testing](https://github.com/CuBoulder/express/tree/dev/tests/behat)

## Download Sauce Connect Proxy for JavaScript test

[Get Sauce Connect Proxy](https://wiki.saucelabs.com/display/DOCS/Sauce+Connect+Proxy)<br />

## Install and Setup the Local Site

To test with Behat, you'll need to enable all the bundles and install local users. And install Sauce Connect Proxy to run the JavaScript tests.

1. **Install behat dependencies** <br />
   In behat folder (/profiles/express/tests/behat): <br />
   `composer install`

1. **Start Lando** `lando start`

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
            base_url: "https://mySiteName.lndo.site"
      ```
## Running Tests

1. **Start webserver** <br />
   `lando drush runserver 127.0.0.1:8079` <br />
   (be sure lando is running)

1. **Start Sauce Connect**
   Login to Sauce Connect and get command with access keys
   [Login to Sauce Connect Tunnel](https://app.saucelabs.com/login) <br />
   Login to Sauce Connect and get command with access keys< br />
   Paste into command line of Sauce Connect folder; wait for connnection
   Back to Sauce Connect Online. You should see Active Tunnel.
   - Click 'Tunnels' on the left <br/>
   - Scroll to bottom; copy command to start with Authentication code
   - In Terminal, go to Sauce's install directory and paste in command
   - Wait for approval 'Sauce Connect Is Up, you may start your tests'

1. **Run the Behat tests** <br />
   From behat folder (/profiles/express/tests/behat), run behat command.  <br />
   Example: <br />
   `./bin/behat --config behat.local.yml --verbose --tags '~@broken&&~@javascript'` <br />
   `./bin/behat --config behat.local.yml --strict --stop-on-failure --verbose --tags '@layout'`

   Tags: specify desired tag(s) either as parameters in the command or in behat.local.yml <br />
   Behat will run the goutte tests first, then will come back and run those tagged with `@javascript`

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
