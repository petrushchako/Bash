# Test Operators in Bash

## Numeric Comparison:
* `-eq`: Equal to
* `-ne`: Not equal to
* `-gt`: Greater than
* `-ge`: Greater than or equal to
* `-lt`: Less than
* `-le`: Less than or equal to

___Example___:

```bash
[ "$a" -eq "$b" ]
```

## String Comparison:
* `=`: Equal to
* `!=`: Not equal to


___Example___:

```bash
[ "$str1" = "$str2" ]
```

## File Operators:
* `-e`: File exists
* `-f`: File is a regular file
* `-d`: File is a directory
* `-s`: File is not empty (size greater than zero)


___Example___:

```bash
[ -e "$file" ]
```

## Logical Operators:
* `!`: Logical NOT
* `-a`: Logical AND
* `-o`: Logical OR

___Example___:

```bash
[ ! -e "$file" -a "$a" -eq "$b" ]
```

## String Tests:
* `-z`: String is empty
* `-n`: String is not empty

___Example___:

```bash
[ -z "$str" ]
```

## Other Tests:
* `test -v var`: Variable is set (available in Bash 4.2 and later)
* `-r`: File is readable
* `-w`: File is writable
* `-x`: File is executable

___Example___:

```bash
[ -r "$file" -a -w "$file" ]
```
<br><br><br>
<hr>
You can use these operators in conditional expressions within `[ ]` to perform various tests and make decisions in your Bash scripts. For more details, you can refer to the Bash manual (`man bash`) and search for the "CONDITIONAL EXPRESSIONS" section.
<hr>