---
title: Drush
layout: default
---

# Misc Drush Commands

Run update script: `drush updb` <br />
Disable modules: `drush dis module_name` <br />
Variables:
```sh
drush vget {variable_name} # find out value of variable
drush vset {variable_name} {value} # set value of variable
drush vdel {variable_name} # delete variable
```

```sh
drush vset site_name 'Two Word Site Name'
drush vset theme_default cusimple
   # Choices are cusimple cuhighlight cutradition cuswatch cuspirit cushadow curise cumodern cuminimal culayers cuivory cusimple
```
Remove roles:
```
drush user-remove-role {role} {comma delimited list of uids, user names, or email addresses }
drush urrol administrator mortone,11,joanna.bertrand@Colorado.EDU
```
Add roles:
```
drush user-add-role {role} {comma delimited list of uids, user names, or email addresses }
drush urol edit_only mortone,11,joanna.bertrand@Colorado.EDU
```




[back](./)
