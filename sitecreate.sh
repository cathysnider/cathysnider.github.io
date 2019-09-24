#!/bin/sh


# Store requested site name
read -p "Enter a name for new site folder please: " MYSITENAME

echo Your directory and Site Name is $MYSITENAME

git clone https://github.com/CuBoulder/drupal-7.x.git $MYSITENAME

cd ${MYSITENAME}/profiles 

git clone https://github.com/CuBoulder/express_mono.git express

cd ../

lando init --source cwd --recipe drupal7 --webroot . --full --name $MYSITENAME

lando start

lando info

lando drush si express express_profile_configure_form.options.cu_core --db-url=mysql://drupal7:drupal7@database:3306/drupal7 -v -y

lando drush php-eval "variable_set('ldap_authentication_conf', array('authenticationMode' => 1));"

lando drush vset site_name $MYSITENAME

cd /profiles/express/tests/behat

composer install

lando drush en cu_behat_tests -y

echo All Done! Your site is ready to run Behat tests. Happy Drupaling. 