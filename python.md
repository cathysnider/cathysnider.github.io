---
title: Python
layout: default
---

# Python

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

The `range()` function returns a sequence of numbers, starting from 0 by default, and increments by 1 (by default), and ends at a specified number. `range(start,stop,step)` It actually stops right before the stop number. <br />
```python
countByTen = range(10,101,10) # starts at 10, goes up to 100 by tens
for myNum in countByTen:  # instantiates variable myNum as first number in the range
   print(myNum)
```



[back](./)
