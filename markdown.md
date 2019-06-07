---
title: All About Markdown
layout: default
---

# All About Markdown

First off, in Markdown, whitespace matters, specifically spaces. If something isn't rendering properly, check that.  

Github uses a flavored markdown. [Here's the spec](https://github.github.com/gfm/) <br />
[CheatSheet and Tutorial by CommonMark](https://commonmark.org/help/)

## Headers
Starting a line with a hash `#` and a `space` makes a header. <br />
`### Header 3 `<br />
The more `#`, the smaller the header.

## Links
Square brackets with link text + parenthesis with link URL. <br />
`[My Repositories](https://github.com/cathysnider/)` <br />
[My Repositories](https://github.com/cathysnider/)

## Graphics
Exclamation point + square brackets with alt text + parenthesis with image URL. <br />
`![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)` <br />
![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)

## Lists
{% include 04-lists.md %}

## Blockquotes
Use a GreaterThan `>` sign <br />
> Last night I dreamt I went to Manderlay again.

## Emphasis
Wrap text with asterisks `*` or underscores `_`, single for italics and double for bold.

`*` This text will be italic `*` <br />
`**` This text will be bold `**`

Escape with a backslash `\*` or `\_` if you want the asterisks/underscores to be themselves.

## Tables
Create tables with pipes | and hyphens -. Pipes separate columns and hyphens signify the column headers.  You must include a blank line before each table row in order for it to correctly render. See [Organizing information with tables](https://help.github.com/en/articles/organizing-information-with-tables)

 | Command | Description |
 | --- | --- |
 | `git status` | List all *new or modified* files |
 | `git diff` | Show file differences that **haven't been** staged |

## Code
* Inline text gets one backtick. <br />
  Solve for x: `2x + 7 = 17`
* Blocks of code get three
  ```
  var i;
  for (i=0; i<5; i++) {
    console.log(i);
  }
  ```




[back](./)
