---
title: Working with Lando
layout: default
---

# Drupal 7 Standard or Express install with Lando

* If you haven’t installed Lando on your machine; now is the time to do so. See **Installing Lando** below.

## 1. Install the Codebase

#### Web Express

1. **Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile** <br />
   Specifically, clone CU Boulder's Hardened Drupal 7 into specified project folder:<br />
   `git clone https://github.com/CuBoulder/drupal-7.x.git {mySiteName}`

   cd into profiles folder and clone down the ExpressMono profile into folder named 'express'<br />
   `cd {mySiteName}/profiles` <br />
   `git clone https://github.com/CuBoulder/express_mono.git express`

#### Plain Old Drupal
   Unzip Drupal 7 Tarball; rename folder to something workable like {mySiteName}. <br />
   Don't forget to copy default.settings.php to settings.php and allow write privileges <br />
   `chmod a+w sites/default`

## 2. Initialize Lando in project folder

   You must initialize Lando before you can go further, since Lando spins up the database that our site will be using. Go back to root of {mySiteName} folder
   `cd ../`  
   and initialize it for Lando. A *.lando.yml* file will be created in your project folder. Lando has an extensive library of parameters. These are the ones we use to start: <br />
   `lando init --source cwd --recipe drupal7  --webroot . --full --name {mySiteName}`

## 3. Start Lando

   `lando start`  

   Once the app has started up correctly, you’ll see the list of your appserver URLs:
   ```
   https://localhost:32845             
   http://localhost:32846              
   http://mysite.lndo.site             
   https://mysite.lndo.site
   ```

   Use the non-secure server protocol or your browser will be unhappy.

   From now on, all your `drush` commands start with lando: `lando drush {drush-command}`.

## 4. Install the chosen Drupal Profile with drush

The database name, login and password are all ‘drupal7.’

`Syntax: lando drush si my_profile_name my_profile_form.my_settings.key=value --db-url=mysql//admin_user:admin_password@db_host:db_port/database_name`

   **PlainOldDrupal7**<br />
   `lando drush si standard --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_testing_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_testing_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_pantheon_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_pantheon_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`


## 5. Enable local login

   **Web Express** <br />
   You can't login with LDAP at this time. You must put the site in Mixed Mode and enable the CU Local Users.

   `lando drush php-eval "variable_set('ldap_authentication_conf', array('authenticationMode' => 1));"`

   `lando drush en cu_local_users -y`

   **PlainOldDrupal7** <br />
   Login with the “drush uli” command: <br />
   `lando drush uli admin` <br />
   It will return a string. Grab everything from ‘user’ on and paste into the browser’s address bar.<br />
   `user/reset/{aBunchOfNumbers}/login`  and paste into browser.


## Done. Go have fun coding.


## Additional Info

#### Enabling the bundles

**Most of Them** <br />
  `lando drush en cu_advanced_content_bundle cu_advanced_design_bundle cu_advanced_layout_bundle cu_news_bundle cu_people_bundle cu_photo_gallery_bundle cu_feeds_bundle cu_seo_bundle cu_social_media_bundle -y`

**All of Them** <br />
 `lando drush en cu_advanced_content_bundle cu_advanced_design_bundle cu_advanced_layout_bundle cu_feeds_bundle cu_news_bundle cu_people_bundle cu_photo_gallery_bundle cu_seo_bundle cu_social_media_bundle cu_forms_bundle cu_video_hero_unit_bundle cu_publications_bundle express_collections_bundle express_localist_bundle cu_digital_campaign_bundle cu_mega_menu_bundle cu_livestream_bundle cu_content_sequence_bundle cu_newsletter_bundle cu_campus_news_bundle express_responsive_visibility_bundle -y`

**Create test content** <br />
   `lando drush en cu_test_content_admin_bundle cu_test_content_articles cu_test_content_blocks cu_test_content_collections cu_test_content_context cu_test_content_gallery cu_test_content_pages cu_test_content_people -y`


## Using SequelPro

SequelPro connects to the Lando database using the external connection port. This number changes every time you restart Lando on your project.  

`lando info`

**Sequel Pro settings are:** <br />
```
Standard
Host: 127.0.0.1
Username: drupal7
Password: drupal7
Database: drupal7
Port: external_connection port
```

**Importing a Database** <br />
Destroy previous database with lando destroy <br />
Connect to SequelPro as above and import database file; File » Import <br />
`scp osr-prod-util01.int.colorado.edu:/nfs/prod_backups/backups/p1f4bca2b935_2019-10-04-09-28-36.sql .`


#### Lando Problems

**Rebuilding a Lando Project** <br />
`lando rebuild` : Rebuilds the lando project while preserving any database data; can solve some problems <br />
`lando destroy` : Destroying a project removes the Lando container and everything contained therein; i.e. your site's database and its contents. It does not delete Drupal core or the Express Profile files cloned from GitHub. You can start over from **Step 4: Install the chosen Drupal Profile with drush.**

**Cannot fully test WebForm** <br />
Emails cannot be sent through Lando; nor does the recaptcha work: `ERROR for site owner: Invalid domain for site key`


#### Misc Drush Commands

Run update script: `lando drush updb` <br />
Disable modules: `lando drush dis module_name` <br />
Variable get and set:
```
lando drush vget {word}
lando drush vset {word} {value}
```

## Installing Lando (One Time Setup)

Get Lando dmg from GitHub; run through package installation <br />
Lando config is created at ~/.lando

**Lando Documentation** <br />
* [https://docs.devwithlando.io/](https://docs.devwithlando.io/)
* [https://api.drupal.org](https://api.drupal.org)



[back](./)
