---
title: Working with Lando
layout: default
---

# Drupal 7 Standard or Express install with Lando

* If you haven’t installed Lando on your machine; now is the time to do so. See **Installing Lando** below.

## Creating Web Express Project

1. **Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile** <br />
   Specifically, clone CU Boulder's Hardened Drupal 7 into specified project folder:<br />
   `git clone https://github.com/CuBoulder/drupal-7.x.git {mySiteName}`

   cd into profiles folder and clone down the ExpressMono profile into folder named 'express'<br />
   `cd {mySiteName}/profiles` <br />
   `git clone https://github.com/CuBoulder/express_mono.git express`

   if PlainOldDrupal7: don't forget to copy default.settings.php to settings.php and allow write privileges <br />
   `chmod a+w sites/default`

1. **Initialize Lando in project folder**<br />
   You must initialize Lando before you can go further, since Lando spins up the database that our site will be using. Go back to root of mySiteName folder <br />
   `cd ../`

   and initialize it for Lando:

   `lando init --source cwd --recipe drupal7  --webroot . --full --name {mySiteName}`

   This creates a .lando.yml file in your project folder. There are lots of parameters. These are ours: <br />
   `lando init`
   * codebase: cwd (current working directory)
   * recipe: drupal7
   * webroot: . (That there's a dot)
   * what to name this: same as project folder (aka mySiteName)

1. **Start Lando; check info**  <br />
   `lando start`  <br />
   `lando info`

   From now on, all your `drush` commands must be `lando drush`.

1. **Install the chosen Drupal Profile with drush** <br />
   Syntax: lando drush si my_profile_name my_profile_form.my_settings.key=value --db-url=mysql//admin_user:admin_password@db_host:db_port/database_name

  **PlainOldDrupal7**
  `lando drush si standard --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   Set profile configure form options to cu_core, cu_testing_core, or cu_pantheon_core:

   **Express cu_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_testing_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_testing_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Express cu_pantheon_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_pantheon_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

There, you are done. Go have fun coding.

### Installing Drupal via the browser:

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

1. **Enable test content** <br />
   `lando drush en cu_test_content_admin_bundle cu_test_content_articles cu_test_content_blocks cu_test_content_collections cu_test_content_context cu_test_content_gallery cu_test_content_pages cu_test_content_people -y`

## Lando Problems

1. **Cannot fully test WebForm** <br />
   Emails cannot be sent through Lando; nor does the recaptcha work: "ERROR for site owner:
Invalid domain for site key"

## Other Lando Commands

### Sharing a Local Site
Useful for sharing work with clients or testing local site on multiple devices. You must specify the URL you want to share using the ---url flag. The URL must be in the form http://localhost:db_port. Get this from `lando info`.

`lando share --url http://localhost:12345`

Sadly, this does not work with our configuration at this time

### Destroying a Lando Project
`lando destroy` <br />
Destroying a project removes the Lando container and everything contained therein; i.e. your site's database and its contents. It does not delete Drupal core or the Express Profile files cloned from GitHub. You can start over from **Step 4: Install the chosen Drupal Profile with drush.**

## Installing Lando (One Time Setup)

Get Lando dmg from GitHub; run through package installation <br />
Lando config is created at ~/.lando

**Lando Documentation** <br />
* [https://docs.devwithlando.io/](https://docs.devwithlando.io/)
* [https://api.drupal.org](https://api.drupal.org)


[back](./)
