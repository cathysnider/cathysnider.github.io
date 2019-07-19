---
title: PHP Basics
layout: default
---

# PHP Basics

## Some String Functions
```php
$myString = 'We\'re having a party!'
strstr($myString, 'soiree'); # Returns FALSE if the string does not exists.
nl2br($myString); # Convert new lines (both n and r) to HTML break tags.
trim($myString); # Remove white space (spaces, new lines and tabs) from the beginning and end.
strlen($myString); # Return the length of the string.
str_replace('party', 'fiesta', $myString); # Replace first bit with second bit in third bit.
strip_tags($myString); # Remove HTML from the string.
strtoupper($myString); # Convert all the characters to uppercase.
ucwords($myString); # Capitalize each word.
date('F j, Y'); # Return the date.

```

[PHP Manual: Strings](https://www.php.net/manual/en/language.types.string.php)

## Arrays

[See arrays at work](https://github.com/cathysnider/gitBasics/blob/master/arrayWork.php)

Pass values into $variable with array() function.

**Simple.**
```php
$mySimpleArray = array('First', 'Second', 'Third');
$mySimpleArray[] = 'Fourth'; # adds item to end
print $mySimpleArray[0]; # selecting an item
```
**Associative.** Set key/value pairs.
```php
$myAssocArray = array('fruit' => 'mango', 'flag' => FALSE, 'born' => 2001,);
$myAssocArray['name'] = 'Daffodil'; # adds item to array
print $myAssocArray['fruit']; # selecting an item
print $myAssocArray[0]; # returns error
```

**Multidimensional.** A nested array.
```php
$myMultiArray = array(
    'Harry' => array('Blood Status' => 'Half-blood', 'Wand' => 'Holly & Phoenix feather','Patronus' => 'Stag',),
    'Ron' => array('Blood Status' => 'Pure-blood','Wand' => 'Ash & Unicorn tail hair','Patronus' => 'Jack Russell Terrier',),
    'Hermione' => array('Blood Status' => 'Muggle', 'Wand' => 'Vine Wood & Dragon Heartstring', 'Patronus' => 'Otter',)
);

$myMultiArray['Neville'] = array('Blood Status' => "pure-blood",'Wand' => 'Cherry, Unicorn tail','Patronus' => "Non-corporeal",); # adds item to end
print $myMultiArray['Hermonie']['Wand']; # selecting an item
```

## Some Array Functions
```php
array_flip() # flips keys and values so one becomes the other
array_rand() # returns randomly chosen key
```
Apparently you can't access randomly chosen values; you gotta flip the array and then rand it. `$choice = array_rand(array_flip($mySimpleArray));`


[PHP Manual: Arrays](https://www.php.net/manual/en/language.types.array.php)

## Objects

**Simple.**
```php
$myObject = new stdClass; # instantiate object

$myObject->Fruit = 'mango';
$myObject->Flag = FALSE;
$myObject->born = 2001;
print $myObject->Fruit; # selecting an item
```

**Multidimensional.**
```php
$myMultiObject = new stdClass; # instantiate top level object
$myMultiObject->Harry = new stdClass; # instantiate first sub object
$myMultiObject->Harry->BloodStatus = half-blood;
$myMultiObject->Harry->Wand = 11, holly, phoenix feather;
$myMultiObject->Harry->Born = Godric\s Hollow, England;

$myMultiObject->Ron = new stdClass; # instantiate second sub object
$myMultiObject->Ron->BloodStatus = pure-blood;
$myMultiObject->Ron->Wand = 12, Ash, unicorn tail hair;
$myMultiObject->Ron->Born = Ottery St Catchpole, Devon, England;

$myMultiObject->Hermione = new stdClass; #instantiate third sub object
$myMultiObject->Hermione->BloodStatus = muggle;
$myMultiObject->Hermione->Wand = 10 3/4, vine wood, dragon heartstring;
$myMultiObject->Hermione->Born = England;

print $myMultiObject->Ron->band; # selecting an item
```

## Looping

**foreach**
The foreach construct provides an easy way to iterate over arrays and objects. On each iteration, the value of the current element is assigned to $value and the internal array pointer is advanced by one (so on the next iteration, you'll be looking at the next element). The second form will additionally assign the current element's key to the $key variable on each iteration.

Simple Arrays `$mySimpleArray = array('First', 'Second', 'Third');`
```php
foreach($mySimpleArray as $value) {
  // do something with $value;
}
foreach($mySimpleArray as $key => $value){
  // do something with $key and $value;
}
```

Multidimensional Arrays
```php
foreach ($multiArrayName as $arrayName => $elementSet) {
echo "<b>" . $arrayName . "</b><br />";
  foreach($elementSet as $key => $value) {
  print $key . ": " . $value . LINEBREAK;
  }
}
```

**while and for**

```php
$i = 1; #initialize counter outside of loop
while ($i <= 5){
  echo '<h' . $i . '>This is heading ' . $i . '</h' . $i . '>';
$i++;
}

for ($i = 1; $i <= 5; $i++) {
  echo '<h' . $i . '>This is heading ' . $i . '</h' . $i . '>';
}
```

## Parsing a String into an Array

1. Pull the data into an output buffer so you can work with it (if you don't use buffer, the data will display on the page)
```php
ob_start(); # start the output buffer;
include('data.txt'); # pull data file into it;
$inputData = ob_get_contents(); # put the contents of the buffer into a variable;
ob_end_clean(); # close output buffer;
```
1. The data is a huge string. 'Explode()' turns a string into an array, splitting the string on the specified character(s).
```php
$inputArray = explode("/n", $inputData);
```
## Functions

**Variable References**
That little `&` there is a pointer back to the original variable.
```php
$originalVar = 'String One ';
function functionWithReference(&$inputVar) {
    $inputVar = 'String Two';
    }
echo $originalVar;
functionWithReference($originalVar);
echo $originalVar;
```
will return `String One String Two `





[PHP Manual: Objects](https://www.php.net/manual/en/language.types.object.php) <br />

[back](./)
