---
title: Testing with Behat
layout: default
---

# Testing with Behat Locally

## Install Behat

To test with Behat, you'll need to enable all the bundles and install local users.

1. **Be in root of MySiteName folder and** ```start lando```

1. **Install Behat test module** <br/>
   This enables all the bundles on your local site, and it enables the local users. <br/>
   ```lando drush en cu_behat_tests -y``` <br />
   Then go to site in browser; put the site in Mixed Mode (config >> LDAP >> Tab 4: Authentication)

   You are now able to sign on as developer/developer or any other role. These users are necessary for local Behat testing. We'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.

1. **Update behat.local.yml with config info for lando server** <br />
   ```lando info``` to verify your local server URL (should be https://mySiteName.lndo.site)<br />
   In behat folder (/profiles/express/tests/behat), edit behat.local.yml file and replace:

      ```bash
          extensions:
           Behat\MinkExtension:
            base_url: "http://127.0.0.1:8079/"
      ```

      With your localhost site address:

      ```bash
          extensions:
           Behat\MinkExtension:
            base_url: "https://mySiteName.lndo.site"
      ```

1. **Install behat dependencies** <br />
   In behat folder (/profiles/express/tests/behat): <br />
  ```composer install```

1. **Start webserver** <br />
         ```lando drush runserver 127.0.0.1:8079```

1. **Run the Behat tests** <br />
   From behat folder (/profiles/express/tests/behat), run behat command.  <br />
   Example: <br />
   ```
   ./bin/behat --config behat.local.yml --verbose --tags '~@broken&&~@javascript'
   ```

## Troubleshooting

If you can no longer login due to too many failed login attempts, empty the flood table.
```
lando mysql
-> use drupal7;
-> delete from flood;
-> exit;
```



[back](./)
