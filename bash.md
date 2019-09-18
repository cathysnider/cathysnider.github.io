---
title: Bash Shell Script
layout: default
---

# Special Characters

`~`  : (Tilde) Home Directory <br />
`.`  : (Period) Current directory. Use in commands to run script from current directory. Otherwise, the system will look for the command in your PATH. `./script.sh` <br />
`..` : (Two periods) Parent directory <br />
`/`  : (One forward slash) Root directory `cd /` <br />
`#`  : (Hash) A comment. Used in shell scripts. <br />
`?`  : (Question Mark) Single character wildcard <br />
`*`  : (Asterisk) Multiple and Single character wildcard <br />
`[]` : (Square Brackets) Character set wildcard - match any of the characters <br />
`;`  : (Semi colon) Shell command separator. Used to type as many commands as you like on the command line. They run in sequence, even if previous command fails. Stop execution on failure by using double ampersand `&&` instead of semicolon. <br />
`&`  : (Ampersand) Run command as background process <br />
`<`  : (Less Than) Input Redirection <br />
`>`  : (Greater Than) Output Redirection <br />
`|`  : (Pipe) Chains commands together. i.e. takes output from one command and feeds it to the next. <br />
`$`  : (Dollar Sign) Variable Expressions



[15 Special Characters](https://www.howtogeek.com/439199/15-special-characters-you-need-to-know-for-bash/)

[back](./)
