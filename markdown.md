---
title: All About Markdown
layout: default
---

# All About Markdown

[CheatSheet and Tutorial by CommonMark](https://commonmark.org/help/)

## Headers
Starting a line with a hash ```#``` and a space makes a header.

The more ```#```, the smaller the header.

## Links
Square brackets with link text + parenthesis with link URL. <br />
[My Repositories](https://github.com/cathysnider/)

## Graphics
Exclamation point + square brackets with alt text + parenthesis with image URL. <br />
![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)

## Lists
{% include 04-lists.md %}

## Emphasis
Wrap text with asterisks ```*``` or underscores ```_```, single for italics and double for bold.

```*``` This text will be italic ```*``` <br />
```**``` This text will be bold ```**``` 

Escape with a backslash ```\*``` or ```\_``` if you want the asterisks/underscores to be themselves.

## Tables
Create tables with pipes | and hyphens -. Pipes separate columns and hyphens signify the column headers.  You must include a blank line before your table in order for it to correctly render.<br />

 | Command | Description |
 | --- | --- |
 | `git status` | List all *new or modified* files |
 | `git diff` | Show file differences that **haven't been** staged |

## Code
Surround text with three backticks. <br />
Inline: Solve for x: ```2x + 7 = 17```

Block of code:
```
var i;
for (i=0; i<5; i++) {
  console.log(i);
}
``


[back](./)
