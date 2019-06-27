---
title: PHP Basics
layout: default
---

# PHP Basics

## Some String Functions

`$myString = 'Lorem ipsum dolor sit amet'`
`strstr($myString, 'greeking');` Returns FALSE if the string does not exists. <br />
`nl2br($myString);` Convert new lines to <br /> tags. <br />
`trim($myString);` Remove white space (spaces, new lines and tabs) from the beginning and end. <br />
`strlen($myString);` Return the length of the string.<br />
`str_replace('example', 'party', $myString);` Replace one part of the string with another.<br />
`strip_tags($myString);` Remove HTML from the string.<br />
`strtoupper($myString);` Covert all the characters to uppercase.<br />
`ucwords($myString);` Capitalize each word. <br />
`date('F j, Y');` Return the date.

See [PHP Manual](http://php.net/manual/en/ref.strings.php) for all string functions.


[back](./)
