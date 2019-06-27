---
title: PHP Basics
layout: default
---

# PHP Basics

## Some String Functions
```sh
$myString = 'Lorem ipsum dolor sit amet'
strstr($myString, 'greeking'); # Returns FALSE if the string does not exists.
nl2br($myString); # Convert new lines to tags.
trim($myString); # Remove white space (spaces, new lines and tabs) from the beginning and end.
strlen($myString); # Return the length of the string.
str_replace('example', 'party', $myString); # Replace one part of the string with another.
strip_tags($myString); # Remove HTML from the string.
strtoupper($myString); # Convert all the characters to uppercase.
ucwords($myString); # Capitalize each word.
date('F j, Y'); # Return the date.

```

[PHP Manual: Strings](http://php.net/manual/en/ref.strings.php)

## Arrays

Pass values into $variable with array() function.

**Simple.**
```sh
$simpleArray = array('First', 'Second', 'Third');
$simpleArray[] = 'Fourth'; # adds item to end
print $simpleArray[0]; # selecting an item
```
**Associative.** Set key/value pairs.
```sh
$assocArray = array('fruit' => 'mango', 'flag' => FALSE, 'born' => 2001,);
$assocArray['name'] = 'Daffodil'; # adds item to end
print $assocArray['fruit']; # selecting an item
print $assocArray[0]; # returns error
```

**Multidimensional.** A nested array.
```sh
$multiArray = array(
  'Harry' => array('year' => 1972, 'band' => 'The Cure','size' => 10,),
  'Ron' => array('year' => 1975,'band' => 'Coldplay','size' => 8,),
  'Hermione' => array('year' => 1969, 'band' => 'Beach Boys', 'size' => 10,),
);
$multiArray['Neville'] = array('year' => 1984,'band' => 'The Beatles','size' => 9,); # adds item to end
print $multiArray['Hermonie']['size']; # selecting an item
```


[back](./)
