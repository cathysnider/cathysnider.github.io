---
title: Working with Lando
layout: default
---

# Drupal 7 Express-mono install with Lando

1. Install Lando
   * https://docs.devwithlando.io/
   * https://api.drupal.org

   Get Lando dmg from GitHub; install it <br />
   Lando config is at ~/.lando

1. Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile:

   Specifically, CU Boulder's Hardened Drupal 7:<br />
   ```git clone https://github.com/CuBoulder/drupal-7.x.git```<br />
   Rename the folder to be a project folder. Like "mylandosite" <br />
   ```mv drupal-7.x mylandosite```

   cd into profiles folder and clone down the ExpressMono profile <br />
   ```cd profiles``` <br />
   ```git clone https://github.com/CuBoulder/express_mono.git``` <br />
   Rename that folder to be 'express' <br />
   ```mv express_mono express```

1. Initialize Lando in project folder
   go back to root of mylandosite folder and initialize it for Lando with the following params:

   ```lando init```
   * codebase: current working directory
   * recipe: drupal7
   * webroot: .
   * what to call this app: same name as project folder {mylandosite}

   This creates a .lando.yml file in your project folder

1. Start Lando; check info <br />
   ```lando start```  <br />
   ```lando info```

1. Install Drupal via browser <br />
   Go to site in browser window (https://mylandosite.lndo.site); accept cert <br />
   Go through the installation process
   * database name: drupal7
   * database username: drupal7
   * database password: drupal7
   * Advanced Options:
     * database host: database
     * database port: 3306

1. Install Express Profile -- one of:
   * Production (choose this one)
   * Testing
   * Pantheon

1. Installing Local Users: <br />
   Install the cu_local_users bundle with drush command: <br />
   ```lando drush en cu_local_users``` <br />
   Then go to site in browser; put the site in Mixed Mode (config >> LDAP >> Tab 4: Authentication) <br />
   You are now able to sign on as developer/developer <br />
   These users are necessary for local Behat testing. We'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.


[back](./)
