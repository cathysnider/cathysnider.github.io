---
title: All About Markdown
layout: default
---

# All About Markdown

First off: in Markdown, whitespace matters, specifically spaces. If something isn't rendering properly, check the spaces.  

Github uses a flavored markdown. [Here's the spec](https://github.github.com/gfm/). <br />
[CheatSheet and Tutorial by CommonMark](https://commonmark.org/help/)

## Headers

Starting a line with a hash `#` and a `space` makes a header.

```md
### Header 3
```

The more `#`, the smaller the header.

## Links

Square brackets with link text + parenthesis with link URL.

```md
[My Repositories](https://github.com/cathysnider/)
```

[My Repositories](https://github.com/cathysnider/)

## Tables

Create tables with pipes `|` and hyphens `-`. Pipes separate columns and hyphens signify the column headers.  You must include a blank line before each table row in order for it to correctly render. See [Organizing information with tables](https://help.github.com/en/articles/organizing-information-with-tables).

```md
 | Column One | Column Two |
 | --- | ---: |
 | Lorem | 12,300 |
 | Ipsum | 5,032 |
 | Dolor | 375,929 |
 ```

 | Column One | Column Two |
 | --- | ---: |
 | Lorem | 12,300 |
 | Ipsum | 5,032 |
 | Dolor | 375,929 |
  ____________

## Code

* Inline text gets one backtick.
  Solve for x: `2x + 7 = 17`
* Blocks of code get three and can include a language code for syntax highlighting
  
  ```js
  var i;
  for (i=0; i<5; i++) {
    console.log(i);
  }
  ```

## Emphasis

Wrap text with asterisks `*` or underscores `_`, single for italics and double for bold.

* `*` This text will be italic `*`
* `**` This text will be bold `**`

Escape with a backslash `\*` or `\_` if you want the asterisks/underscores to be themselves.

## Graphics

Exclamation point + square brackets with alt text + parenthesis with image URL.

```md
![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)
```

![Pears](https://spot.colorado.edu/~sniderc/images/digitalart/pears.jpg)

## Blockquotes

Use a GreaterThan `>` sign

> Last night I dreamt I went to Manderley again.

## Lists

{% include markdown-lists.md %}

[back](./)
