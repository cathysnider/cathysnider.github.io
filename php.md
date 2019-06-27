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

## Arrays

Pass values into $variable with array() function.

Simple.
```
$simpleArray = array('First', 'Second', 'Third');`
$simpleArray[] = 'Fourth'; # adds item to end
print $simpleArray[0]; # selecting an item
```
Associative. Set key/value pairs.
```
$assocArray = array('fruit' => 'mango', 'flag' => FALSE, 'born' => 2001,);
$assocArray['name'] = 'Daffodil'; # adds item to end
print $assocArray['fruit']; # selecting an item
print $assocArray[0]; # returns error
```

Multidimensional. A nested array.
```
$multiArray = array(
  'Harry' => array('birthyear' => 1972, 'fav_band' => 'The Cure','shoe_size' => 10,),
  'Ron' => array('birthyear' => 1975,'fav_band' => 'Coldplay','shoe_size' => 8,),
  'Hermione' => array('birthyear' => 1969, 'fav_band' => 'Beach Boys', 'shoe_size' => 10,),
);
$multiArray['Neville'] = array('birthyear' => 1984,'fav_band' => 'The Beatles','shoe_size' => 9,); # adds item to end
print $multiArray['Hermonie']['shoe_size']; # selecting an item
```


[back](./)
