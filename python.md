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

Variables are typed at time of instantiation.
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
    print(n) # interates over entire array
```
Break: if condition is met, loop terminates and processing falls through to next code block.
Continue: if condition is met, skip rest of loop and continue from the top
```
for (condition):
   if (condition):break
   if (condition):continue
   statements
```

[back](./)
