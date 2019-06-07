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
Square brackets with link text + parenthesis with link URL. \
[My Repositories](https://github.com/cathysnider/)

## Graphics
Exclamation point + square brackets with alt text + parenthesis with image URL. \
![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)

## Lists
{% include 04-lists.md %}

## Emphasis
Italics: surround text with single asterisk or underline. \
*This text will be italic* \
_This will also be italic_

Bold: surround text with double asterisk or underline. \
**This text will be bold** \
__This will also be bold__

## Tables
Create tables with pipes | and hyphens -. Pipes separate columns and hyphens signify the column headers.  You must include a blank line before your table in order for it to correctly render.
 | Command | Description |
 | --- | --- |
 | `git status` | List all *new or modified* files |
 | `git diff` | Show file differences that **haven't been** staged |

## Code
Surround text with three backticks. \
Inline: Solve for x: ```2x + 7 = 17``` \
Block of code:
```
var i;
for (i=0; i<5; i++) {
  console.log(i);
}
``


[back](./)
