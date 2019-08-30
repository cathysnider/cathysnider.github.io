---
title: Working with Lando
layout: default
---

# Drupal 7 Express-mono install with Lando

## Creating Web Express Project

1. **Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile** <br />
   Specifically, CU Boulder's Hardened Drupal 7 into specified project folder:<br />
   `git clone https://github.com/CuBoulder/drupal-7.x.git {mySiteName}`

   cd into profiles folder and clone down the ExpressMono profile into folder named 'express'<br />
   `cd {mySiteName}/profiles` <br />
   `git clone https://github.com/CuBoulder/express_mono.git express`

1. **Initialize Lando in project folder**<br />
   You must initialize Lando before you can go further, since Lando spins up the database that our site will be using. Go back to root of mySiteName folder <br />
   `cd ../`

   and initialize it for Lando:

   `lando init --source cwd --recipe drupal7  --webroot . --full --name mySiteName`

   This creates a .lando.yml file in your project folder. There are lots of parameters. These are ours: <br />
   `lando init`
   * codebase: current working directory
   * recipe: drupal7
   * webroot: .
   * what to call this app: same name as project folder (mySiteName)

1. **Start Lando; check info**  <br />
   `lando start`  <br />
   `lando info`

   From now on, all your `drush` commands must be `lando drush`.

1. **Install the chosen Drupal Profile with drush** <br />
   Syntax: lando drush si my_profile_name my_profile_form.my_settings.key=value --db-url=mysql//admin_user:admin_password@db_host:db_port/database_name

   Set profile configure form options to cu_core, cu_testing_core, or cu_pantheon_core:

   **cu_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **cu_testing_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_testing_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **cu_pantheon_core** <br />
     `lando drush si express express_profile_configure_form.options.cu_pantheon_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y`

   **Skip to "Install the bundles"**

1. **Install Drupal via browser** <br />
   Go to site in browser window (https://mySiteName.lndo.site); accept cert <br />
   Go through the installation process
   * database name: drupal7
   * database username: drupal7
   * database password: drupal7
   * Advanced Options:
     * database host: database
     * database port: 3306

1. **Install Express Profile -- one of:**
   * Production (cu-core)
   * Testing (cu_testing_core)
   * Pantheon (cu_pantheon_core)

1. **Install the bundles if desired:** <br />
   `lando drush en cu_advanced_content_bundle cu_advanced_design_bundle cu_advanced_layout_bundle cu_news_bundle cu_people_bundle cu_photo_gallery_bundle cu_feeds_bundle cu_seo_bundle cu_social_media_bundle -y`

1. **Install local users if desired:** <br />
   `lando drush en cu_local_users -y`

1. **Install test content if desired:** <br />
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
Destroying a project removes the Lando container and everything contained therein; i.e. your site's database and its contents. It does not delete Drupal core or the Express Profile files cloned from GitHub. You can start over from Step 3: Start Lando; then enable bundles, local users and test content.

## Installing Lando (One Time Setup)

Get Lando dmg from GitHub; run through package installation <br />
Lando config is created at ~/.lando

**Lando Documentation** <br />
* [https://docs.devwithlando.io/](https://docs.devwithlando.io/)
* [https://api.drupal.org](https://api.drupal.org)


[back](./)
