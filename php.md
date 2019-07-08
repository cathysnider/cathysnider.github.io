---
title: PHP Basics
layout: default
---

# PHP Basics

## Some String Functions
```sh
$myString = 'Lorem ipsum dolor sit amet'
strstr($myString, 'greeking'); # Returns FALSE if the string does not exists.
nl2br($myString); # Convert new lines (both n and r) to HTML break tags.
trim($myString); # Remove white space (spaces, new lines and tabs) from the beginning and end.
strlen($myString); # Return the length of the string.
str_replace('party', 'fiesta', $myString); # Replace one part of the string with another.
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
$mySimpleArray = array('First', 'Second', 'Third');
$mySimpleArray[] = 'Fourth'; # adds item to end
print $mySimpleArray[0]; # selecting an item
```
**Associative.** Set key/value pairs.
```sh
$myAssocArray = array('fruit' => 'mango', 'flag' => FALSE, 'born' => 2001,);
$myAssocArray['name'] = 'Daffodil'; # adds item to array
print $myAssocArray['fruit']; # selecting an item
print $myAssocArray[0]; # returns error
```

**Multidimensional.** A nested array.
```sh
$myMultiArray = array(
  'Harry' => array('year' => 1972, 'band' => 'The Cure','size' => 10,),
  'Ron' => array('year' => 1975,'band' => 'Coldplay','size' => 8,),
  'Hermione' => array('year' => 1969, 'band' => 'Beach Boys', 'size' => 10,),
);
$myMultiArray['Neville'] = array('year' => 1984,'band' => 'The Beatles','size' => 9,); # adds item to end
print $myMultiArray['Hermonie']['size']; # selecting an item
```
[PHP Manual: Arrays](https://www.php.net/manual/en/language.types.array.php)

## Objects

**Simple.**
```sh
$myObject = new stdClass; # instantiate object

$myObject->Fruit = 'mango';
$myObject->Flag = FALSE;
$myObject->born = 2001;
print $myObject->Fruit; # selecting an item
```

**Multidimensional.**
```sh
$myMultiObject = new stdClass; # instantiate top level object
$myMultiObject->Harry = new stdClass; # instantiate first sub object
$myMultiObject->Harry->year = 1972;
$myMultiObject->Harry->band = 'The Cure';
$myMultiObject->Harry->size = 10;

$myMultiObject->Ron = new stdClass; # instantiate second sub object
$myMultiObject->Ron->year = 1975;
$myMultiObject->Ron->band = 'Coldplay';
$myMultiObject->Ron->size = 8;

$myMultiObject->Hermione = new stdClass; #instantiate third sub object
$myMultiObject->Hermione->year = 1969;
$myMultiObject->Hermione->band = 'Beach Boys';
$myMultiObject->Hermione->size = 10;

print $myMultiObject->Ron->band; # selecting an item
```

## Looping

**foreach**

Simple Arrays `$mySimpleArray = array('First', 'Second', 'Third');`
```sh
foreach($mySimpleArray as $variableName) {
  // do something with $variableName;
}
```
Multidimensional Arrays
```sh
foreach($myMultiArray as $personArrayName => $arrayDetails){
  // do something with the $details[''];
  echo $personArrayName      # returns Harry;
  echo $arrayDetails['year']; # returns 1972;
  echo $arrayDetails['band']; # returns The Cure;
  echo $arrayDetails['size']; # returns 10;
}
```

**while and for**
```sh
$i = 1; #initialize counter outside of loop
while ($i <= 5){
echo '<h' . $i . '>This is heading ' . $i . '</h'. $i .'>';
$i++;
}

for ($i = 1; $i <= 5; $i++) {
  echo '<h' . $i . '>This is heading ' . $i . '</h'. $i .'>';
}

```


[PHP Manual: Objects](https://www.php.net/manual/en/language.types.object.php)
[back](./)
