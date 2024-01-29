# Bash

## What is the bash scripting?

- Bash scripts are like movie scripts: A movie script tells actors what to say at what time, while Bash scripts tell Bash **what to do at what time**.
- Bash scripts are a **simple text file** containing a series of commands we want to automate running rather than running them.
- We need to remember to set the **execute** bit on a file before we try to run the script, and that the script should start with a **"shebang"**.

> The shabang<br>
> `#!/bin/sh`

## Working with special characters

Common Special Characters Used in Bash
|Character | Function |
|---|---|
| `" "` or `' '`| Denotes whitespace. Single quotes preserve literal meaning; double quotes allow substitutions.|
|`$`| Denotes an expansion (for use with variables, command substitution, arithmetic substitution, etc.)|
| `\ `|Escape character. Used to remove "specialness" from a special character.|
|`#`|Comments. Anything after this character isn't interpreted.|
|`=`|Assignment|
|`[]`or `[[]]`|Test; evaluates for either true or false|
|`!`| Negation|
|`>>` `>` `<`|Input/output redirection|
| `\|`|Pipe. Sends the output of one command to the input of another.|
|`*` or `?`|Globs (aka, wildcards). ? is a wildcard for a single character.|

### 
