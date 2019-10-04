---
title: Working with Lando
layout: default
---

# Drupal 7 Standard or Express install with Lando

* If you haven’t installed Lando on your machine; now is the time to do so. See **Installing Lando** below.

## Creating Drupal Project

### Web Express

1. **Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile** <br />
   Specifically, clone CU Boulder's Hardened Drupal 7 into specified project folder:<br />
   `git clone https://github.com/CuBoulder/drupal-7.x.git {mySiteName}`

   cd into profiles folder and clone down the ExpressMono profile into folder named 'express'<br />
   `cd {mySiteName}/profiles` <br />
   `git clone https://github.com/CuBoulder/express_mono.git express`

### Plain Old Drupal
   Unzip Drupal 7 Tarball; rename folder to something workable like {mySiteName}. <br />
   Don't forget to copy default.settings.php to settings.php and allow write privileges <br />
   `chmod a+w sites/default`

1. **Initialize Lando in project folder**<br />
   You must initialize Lando before you can go further, since Lando spins up the database that our site will be using. Go back to root of mySiteName folder  `cd ../`  and initialize it for Lando. This creates a .lando.yml file in your project folder. There are lots of parameters. These are ours: <br />
   `lando init`
   * codebase: cwd (current working directory)
   * recipe: drupal7
   * webroot: . (That there's a dot)
   * what to name this: same as project folder (aka mySiteName)

   `lando init --source cwd --recipe drupal7  --webroot . --full --name {mySiteName}`

1. **Start Lando; check info**  <br />
   `lando start`  <br />
   `lando info`

   From now on, all your `drush` commands start with lando: `lando drush`.

1. **Install the chosen Drupal Profile with drush** <br />
   Syntax: lando drush si my_profile_name my_profile_form.my_settings.key=value --db-url=mysql//admin_user:admin_password@db_host:db_port/database_name

   **PlainOldDrupal7**<br />
   `lando drush si standard --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_testing_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_testing_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_pantheon_core** <br />
   `lando drush si express express_profile_configure_form.options.cu_pantheon_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`


1. **Enable local login** <br />
   You can't login with LDAP at this time. You must put the site in Mixed Mode and enable the CU Local Users. <br />
   `lando drush php-eval "variable_set('ldap_authentication_conf', array('authenticationMode' => 1));"` <br />
   `lando drush en cu_local_users -y`

   **PlainOldDrupal7** <br />
   For local sites where you may not have LDAP ability to login, or if you are working locally without internet access, use the "drush uli" command: <br />
   In the express site folder, type
   `lando drush uli sniderc` ... `lando drush uli admin` ... use admin password. <br />
   It will return a string. Grab everything from 'user' on <br />
   `user/reset/{aBunchOfNumbers}/login`  and paste into browser.


There, you are done. Go have fun coding.



#### Installing Drupal via the browser:

Should you desire to install Drupal via the browser rather than the command line, here are the specs:

* **Install Drupal via browser** <br />
  Go to site in browser window (https://mySiteName.lndo.site); accept cert <br />
  Go through the installation process
   * database name: drupal7
   * database username: drupal7
   * database password: drupal7
   * Advanced Options:
     * database host: database
     * database port: 3306

* **Install Express Profile -- one of:**
  * Production (cu-core)
  * Testing (cu_testing_core)
  * Pantheon (cu_pantheon_core)


## Install Test Content  

For functional testing, you may want to install a bunch of test content.

1. **Enable the bundles** <br />
   `lando drush en cu_advanced_content_bundle cu_advanced_design_bundle cu_advanced_layout_bundle cu_news_bundle cu_people_bundle cu_photo_gallery_bundle cu_feeds_bundle cu_seo_bundle cu_social_media_bundle -y`

   or

   `lando drush en cu_advanced_content_bundle cu_advanced_design_bundle cu_advanced_layout_bundle cu_feeds_bundle cu_news_bundle cu_people_bundle cu_photo_gallery_bundle cu_seo_bundle cu_social_media_bundle cu_forms_bundle cu_video_hero_unit_bundle cu_publications_bundle express_collections_bundle express_localist_bundle cu_digital_campaign_bundle cu_mega_menu_bundle cu_livestream_bundle cu_content_sequence_bundle cu_newsletter_bundle cu_campus_news_bundle express_responsive_visibility_bundle -y`

1. **Enable test content** <br />
   `lando drush en cu_test_content_admin_bundle cu_test_content_articles cu_test_content_blocks cu_test_content_collections cu_test_content_context cu_test_content_gallery cu_test_content_pages cu_test_content_people -y`


## Using SequelPro

`lando info` to get the port for external connection. It changes every time you restart Lando on your project.

Sequel Pro settings are: <br />
Standard <br />
Host: 127.0.0.1<br />
Username: drupal7 <br />
Password: drupal7 <br />
Database: drupal7 <br />
Port: Use External Port Number.  <br />
Click 'Connect'

### Importing a Database

`scp osr-prod-util01.int.colorado.edu:/nfs/prod_backups/backups/p1f4bca2b935_2019-10-04-09-28-36.sql .`
Destroy previous database with `lando destroy` <br />
Connect to SequelPro as above and import database file; File >> Import

## Lando Problems

1. **Rebuilding a Lando Project** <br />
`lando rebuild` <br />
Rebuilds the lando project while preserving any database data; can solve some problems <br />
`lando destroy` <br />
Destroying a project removes the Lando container and everything contained therein; i.e. your site's database and its contents. It does not delete Drupal core or the Express Profile files cloned from GitHub. You can start over from **Step 4: Install the chosen Drupal Profile with drush.**

1. **Cannot fully test WebForm** <br />
   Emails cannot be sent through Lando; nor does the recaptcha work: "ERROR for site owner:
Invalid domain for site key"

## Other Lando Commands

### Sharing a Local Site
Useful for sharing work with clients or testing local site on multiple devices. You must specify the URL you want to share using the ---url flag. The URL must be in the form http://localhost:db_port. Get this from `lando info`.

`lando share --url http://localhost:12345`

Sadly, this does not work with our configuration at this time

## Installing Lando (One Time Setup)

Get Lando dmg from GitHub; run through package installation <br />
Lando config is created at ~/.lando

**Lando Documentation** <br />
* [https://docs.devwithlando.io/](https://docs.devwithlando.io/)
* [https://api.drupal.org](https://api.drupal.org)



[back](./)
