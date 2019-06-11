---
title: Working with Lando
layout: default
---

# Working with Lando

Installing Lando and setting up a Drupal 7 Express mono install

1. Install Lando

Docs:
•	https://docs.devwithlando.io/
•	https://api.drupal.org

Get Lando dmg from GitHub; install it
Lando config is at ~/.lando


1. Set up a project folder with CU Boulder Drupal 7 Express Codebase and Profile:

Specifically, CU Boulder's Hardened Drupal 7:
```git clone https://github.com/CuBoulder/drupal-7.x.git```
This creates a folder called Drupal-7-x

Rename the folder to be a project folder. Like "mylandosite"
cd into profiles and clone down the CU Web Express Profile
```git clone https://github.com/CuBoulder/express_mono.git```
rename that folder to be 'express'

1. Initialize Lando in project folder
go back to root of mylandosite folder and initialize it for Lando:

```lando init```
•	codebase: current working directory
•	recipe: drupal7
•	webroot: .
•	what to call this app: same name as project folder {mylandosite}

This creates a .lando.yml file in your project folder

1. Start Lando; check info
```lando start```
```lando info```


1. Install Drupal via Browser
Go to the site in browser window (https://mylandosite.lndo.site); accept cert
Go through the installation process

 * database name: drupal7
 * database username: drupal7
 * database password: drupal7
 * Advanced Options:
   * database host: database
   * database port: 3306

1. Install Express Profile -- one of:*
 * Production (choose this one)
 * Testing
 * Pantheon


Installing Local Users:
local sites: install the cu_local_users bundle with drush command:
```lando drush en cu_local_users```
Then go to site in browser; put the site in Mixed Mode (config >> LDAD >> Tab 4: Authentication)
You are now able to sign on as developer/developer
These users are necessary for local Behat testing. In addition, we'll especially need to use these local users when the WebExp team users are not longer automatically added to Express installs.


[back](./)
