---
title: Python
layout: default
---

# Python

## Functions and Variables

Spaces matter. No curly braces. No semi-colons. <br />
Create function by
```python
def functionName(num,term):  # no curly braces; yes a colon
   start line with spaces # no semi-colon to indicate end of line
   same number of spaces  # use same number of spaces for same code level
```

Python lets you call functions with their named parameters named, and not in order. <br />
`functionName(term="Spring", num=5)`

 Set a default value for function with example: def myFunction(n=5):

Fun facts <br />
 - `print('print this', end=' ')` 'end' parameter to use something other that default line return

## Statements and Expressions

A statement is a unit of execution; an expression is a unit of evaluation.

In Python: <br />
A statement is a line of code<br />
An expression is any combination of literals, identifiers and operators; anything that returns a value



## Data Types
 - String
 - Numeric
 - Boolean
 - None
 - Sequence
 - Create your own

Variables are typed at time of instantiation. Called 'Duck Typing' -- if it looks like a duck and quacks like a duck it is a duck. Clever.

Variable types can be changed -- just assign a different type value to it.<br />
```python
variableOne = 4; # It's an integer
print (variableOne + 3) # Returns a 7
variableOne = "four" # Now it's a string
print (variableOne + 3) # Results in error; can't join different types
```
Use the `+` to add integers and concatenate strings. <br />
Convert integer to string with str()
`print (variableOne + str(3))`

In Python 3, all types are classes.

The `range()` function returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default), and ends at a specified number. `range(start,stop,step)` It actually stops right before the stop number. Default is `range(0,stop,1)` note that stop number MUST be supplied. <br />
```python
countByTen = range(10,101,10) # starts at 10, goes up to 100 by tens
for myNum in countByTen:  # instantiates variable myNum as first number in the range
   print(myNum)
```
## Conditionals
**If Elseif Else**
```python
if (condition):   # colon
    statements
elif (condition): # colon
    statements
else:             # colon
    statements
```
**Conditional Statement**
Basically an If Else all in one line
`myString = "X is Bigger!" if (x < y) else "X is NOT Bigger!"`

There is no Switch Case in Python.

## Loops
Python has only two ways of doing loops: `while` and `for`
```python
while(condition): #colon
   statements

for n in range(x,y):
  statements
```

**The For Loop**
Other Languages: `for (i=0, i<5, i++)` <br />
Python: `for n in range(x,y,z)` <br />
The counter is initialized to `x` (default 0); the condition is `n<y`; the step is `z`.  <br />
basically translates to `for (i=x, i<y, i+z)` and `n` is set to each iteration.

For Loops also iterate over arrays.
```python
days=["Mon","Tues","Wed","Thurs","Fri","Sat","Sun"]
for d in days:
   print(d)
numbers=[3,4,5,6,7]
for n in numbers:
    print(n) # iterates over entire array
```
`(enumerate(myArray))` will return the index number

```python
days=["Mon","Tues","Wed","Thurs","Fri","Sat","Sun"]
for i,d in enumerate(days):
   print(i, d)  # prints index number and array element
```

Break: if condition is met, loop terminates and processing falls through to next code block.
Continue: if condition is met, skip rest of loop for that iteration and continue from the top
```
for (condition):
   if (condition):break
   if (condition):continue
   statements
```

## Objects aka Classes
A class is a code template for creating objects. Each object is an instance of its class. When defining a class, the first parameter of any function with the object is called the `self` parameter. It 1) always refers to the object itself, and 2) is mandatory. It is a reference to the current instance of the class, and is used to access variables that belongs to the class. It is usually named `self` but you can actually call it whatever you like; it always refers to this instance of the object. Again, it has to be the first parameter of any function in the class.

```python
class personObject:
  def __init__(self, name, age): # init function defines variables that MUST be set at runtime
    self.name = name
    self.age = age

  gender = "" # variables can be instantiated as null

  def myFunc(self):
    print("Hello, my name is " + self.name)

personOne = personObject("James", 14)
print(personOne.age) # prints 14
personOne.myFunc() # prints "Hello, my name is James"
personOne.gender = "male" # set variable value

```

## Misc Libraries
Oh my god so many of them ... <br />
[Python Standard Library](https://docs.python.org/3/library/) <br />
Import Date and Time: `from datetime import [date, time, datetime, timedelta]`
```python
now = datetime.now() # built in method
print("It is now " , now)
print("Later on, it will be: ", now + timedelta(days=60, hours=10, minutes=7)) # built in method
```

## Data Structures
 - Arrays
 - Linked Lists
 - Stacks and Queues
 - Hash Tables

## Recursion
When a program calls itself. There must be a breaking condition in order to avoid infinite loops. A call stack (implemented with Stack data structure, above) keeps track of the arguments.

## Sorting
These are serious mathematical puzzle solving solutions.
 - Bubble Sort
 - Merge Sort
 - Quick Sort

## Searching
 - Unsorted Lists
 - Sorted Lists

## Strings in Python
 Define multi-line strings with three quotes and it will print that way.
 ```
 myString = '''
   a whole bunch of lines of text
   more and more text
 '''
 ```
 Reference characters in strings by their index value. Example:
 `myMessage = 'Python for Beginners'` <br />
 `myMessage[0]` will return 'P'; `myMessage[7]` returns 'f'; AND you can count backwards:  `myMessage[-1]` returns the last character in the string. <br />
 `myMessage[0:3]` returns a range. As in all Python ranges, the range stops right BEFORE the specified index; that is, the character at the specified index number is not included in the return set.  Ranges: default start = 0; default end = 0. So `[:]` is essentially "start to end"

### Formatted Strings
Formatted Strings make it easier to visualize the output of a dynamically generated string. <br />
A formatted string is prefixed with an 'f'. <br />

`message = f'{firstName} {lastName} is {status}'` Note the awesomeness of not having to concatenate it all.  <br />

### String Methods
len(myString): length (This function is actually general purpose; not a string method)<br />
```sh
myString.AllKindsOfStuff() <br />
myString.find('n') # Returns an index number; if not found, returns -1
myString.replace('C','K') # Changes out first for second
```
'IN' operator: returns true or false. <br />
`'James' in myString`

## Arithmetic Operations
Number types: Integers and Floats <br />
Operators: `+` addition; `-` subtraction; `/` division; `//` division return integer; `%` division return remainder; `**` power of <br />
Augmented Assignment Operators: `+=`; `-=`

## Python Code Template

```
def main():
  all the code here

if __name__ == '__main__': main()
```

This little conditional statement is a common way of writing python. It forces the interpreter to read the entire script before it executes any of the code; allowing a more procedural style of programming.









[back](./)
