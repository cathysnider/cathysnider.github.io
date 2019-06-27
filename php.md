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

[PHP Manual: Strings](https://www.php.net/manual/en/language.types.string.php)

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
[PHP Manual: Arrays](https://www.php.net/manual/en/language.types.array.php)

## Objects

**Simple.**
```sh
$myObject = new stdClass; # instantiate top level object

$myObject->Fruit = 'mango';
$myObject->Flag = FALSE;
$myObject->born = 2001;
print $myObject->Fruit; # selecting an item
```

**Multidimensional.**
```sh
$multiObject = new stdClass;
$multiObject->Harry = new stdClass; # instantiate first sub object
$multiObject->Harry->year = 1972;
$multiObject->Harry->band = 'The Cure';
$multiObject->Harry->size = 10;

$multiObject->Ron = new stdClass; # instantiate second sub object
$multiObject->Ron->year = 1975;
$multiObject->Ron->band = 'Coldplay';
$multiObject->Ron->size = 8;

$multiObject->Hermione = new stdClass; #instantiate third sub object
$multiObject->Hermione->year = 1969;
$multiObject->Hermione->band = 'Beach Boys';
$multiObject->Hermione->size = 10;

print $multiObject->Ron->band; # selecting an item
```

[PHP Manual: Objects](https://www.php.net/manual/en/language.types.object.php)
[back](./)
