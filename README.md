# Bash

- **Basics of bash scripting**
    - [What Is Bash Scripting?](#what-is-bash-scripting)
    - [Working with Special Characters](#working-with-special-characters)
    - [Implementing and/or Lists](#implementing-and-or-lists)
    - [Redirecting I/O, Utility Commands, and Pipes](#redirecting-io-utility-commands-and-pipes)
    - [Demoggification (or UUOC: Useless Use of cat)](#demoggification-or-uuoc-useless-use-of-cat)

- **Variables**
    - [What Do Variables Look Like and How Do We Use Them?](#what-do-variables-look-like-and-how-do-we-use-them)
    - [Introducing Bash Functions](#introducing-bash-functions)
    - [Working with Arrays in Bash](#working-with-arrays-in-bash)

- **Substitutions**
    - [Command Substitutions](#command-substitutions)
    - [Process Substitutions](#process-substitutions)

- **Flow Control**
    - [Using the for Loop](#using-the-for-loop)
    - [Using the while or until Loop](#using-the-while-or-until-loop)
    - [Handling Signals and Traps](#handling-signals-and-traps)
    - [Using Exit Status, Tests, and Builtins](#using-exit-status-tests-and-builtins)

- **Learn about Heredocs**
    - [What is Heredoc?](#what-is-a-heredoc)
    - [What is Herestring?](#what-is-a-herestring)

- **Debugging Bash Scripts**
    - [Using Bash Builtins to Troubleshoot Problems: Part 1](#using-bash-builtins-to-troubleshoot-problems-part-1)
    - [Using Bash Builtins to Troubleshoot Problems: Part 2](#using-bash-builtins-to-troubleshoot-problems-part-2)

- **Quick and Dirty Regex in Bash**
    - [What is Regex?](#what-is-regex)
    - [How Does Bash Regex Work?](#how-does-bash-regex-work)

## What is bash scripting?

- Bash scripts are like movie scripts: A movie script tells actors what to say at what time, while Bash scripts tell Bash **what to do at what time**.
- Bash scripts are a **simple text file** containing a series of commands we want to automate running rather than running them.
- We need to remember to set the **execute** bit on a file before we try to run the script, and that the script should start with a **"shebang"**.

> The shebang<br>
> `#!/bin/sh`

<br><br>
## Working with Special Characters

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



<br><br>
## Environment varaiables

- You can access all environment varaiables by simply running `env` command in your terminal

    ```shell
    env

    TERM_PROGRAM=Apple_Terminal
    SHELL=/bin/bash
    OLDPWD=/Users
    USER=alex
    PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
    PWD=/Users/alex
    LANG=en_GB.U
    HOME=/Users/alex
    ```

- Then you can access each `env` variable by prefixing its name with `$` (i.e. `$PWD` also see example below):

    ```bash
    #!/bin/bash

    echo "Creating a folder in $PWD/backup"
    mkdir backup
    ```

<br><br>
## Implementing and/or Lists

- **AND** list **`&&`** 

    A string of commands where the next command is only executed if the previous command exited with **a status of zero**.

- **OR** list **`||`**

    A string of commands where the next command is only executed if the previous command exited with **a non-zero status**.


<br>

**Exit statuses**
- **Zero Exit Status**

    Implies the script or program ran to completion and everything is fine.
- **Non-Zero Exit Status**

    Results can vary based on the script or program that generated the exit status.

<br>
<br>

> **To print the exist status of the script**<br>
> `echo $?`

> **To customize a exit code of your command you can use `exit <number>`**<br>
>`exit 127`


<br>
<br>
 
## Redirecting I/O, Utility Commands, and Pipes
||||
|---|---|---|
|**`>`**|Redirects to a file|`ls - 1R > directory-tree.txt`|
|**`>>`**|Redirects to a file, appending data|`echo mylabserver.com >> /etc/hosts`|
|**`<`**|Redirects file as input for a command|`sort < unsorted_list. txt`|

> NOTE: <br>
> You can also use both redirection within one command:<br>
>`sort < unsorted_list.txt > sorted_list.txt`


- **STDOUT**

    The strdout (`1`) is being redirected to a file.

    ![](img/stdout.png)

<br>

- **STDERR**

    Use the `2>` to redirect error output of the command (if any) to the `error_file`

    ![](img/stderr.png)

<br>

- **redirect both**

    ![](img/redirect_output.png)


<br><br>

**Create your own file descriptor**

```shell
echo "abc 123" > file
exec 5<> file
read -n 3 var <&5
echo $var
exec 5>&-
```

### Utility Commands
|Command|Description|
|---|---|
|`sort`|Sorts input and prints a sorted output
|`uniq`|Removes duplicate lines of data from the input stream
|`grep`|Searches incoming lines for matching text
|`fmt`|Receives incoming text and outputs formatted text
|`tr`|Translates characters
|`head`/`tail`|Outputs the first/last few lines of a file
|`sed`|Stream Editor: More powerful than tr as a character translator
|`awk`|An entire programming language designed for constructing filters. Very powerful and complex.

<br><br>
### Pipe

- Redirect output of first command to a second with **`|`**

    ![](img/pipe.png)




<br><br>
## Demoggification (or UUOC: Useless Use of cat)
> Demoggification on the high level is defined as remuving useless use of `cat`s.


- **Bad practice**
    ```shell
    $ cat /etc/passwd | grep rob
    rob::1000:1000: rob:/home/rob:/bin/bash
    ```
    - This will result in long running time when working on large files. 

- **Good practice**
    - Instead you should use `grep` function to search through the file for content. 

    - Search (`grep`) for `rob` in the file under the path `/etc/passwd`
    ```shell
    $ grep rob /etc/passwd
    rob:x:1000:1000:rob:/home/rob:/bin/bash
    ```
    - Redirect `<` file output to `grep` command and serach for `rob`
    ```shell
    $ grep rob </etc/passwd
    rob::1000:1000: rob: /home/rob:/bin/bash
    ```

- **Bad practice**
    - Use netcat to probe the website, just to see that it exists. You can use this in the if statement to make sure that you web server has started before sending api request, or for monitoring, etc. 
    ```shell
    $ nc -z www. acloud.guru 80 >&/dev/null
    ```
    - But rather then running a separate binary, you should use example below.
- **Good practice**
    - Use build-in bash capability to open its own TCP port. 
    ```shell
    $ 2> /dev/null >/dev/tcp/www.acloud.guru/80
    ```
    - This should not make much differece for a samll scripts, but will improve performance in larger calculations. 

<br><br>
<hr>

### Backup script example
- Create a file

    ```shell
    vim backup.sh
    ```
- Add backup script content
    ```bash
    #!/bin/bash
    # Backing up required files

    echo "Creating backup directory" && mkdir ~/backup 2> /dev/null|| echo "Directory already exists"
    echo 'Copying files' && cp /usr/bin/* ~/backup > log_file 2>$1

    grep -i denied log_file | tail -n 2

    exit 127
    ```

- Assign execution permission
    ```shell
    chmod 744 backup.sh
    ```
- Run the script
    ```shell
    ./backup.sh

    #Cleanup
    rm -rf ~/backup
    ```
<hr>

<br><br><br><br>

## Variables

## What Do Variables Look Like and How Do We Use Them?
- Bash variables do not have data types
- All bash variables begins with `$` when referenced
- When setting a variable, DO NOT preface it with `$`


### Global vs. Local Variables
#### Global variable examples
|||
|---|---|
|`SHELL`|SHELL=/bin/bash|
|`LANG`|LANG=en_US.UTF-8|
|`MAIL`|MAIL=/var/spool/mail/cloud_user|
|`PATH`|PATH=/home/cloud_user/.local/bin:/home/cloud_user/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin|
|`HOSTNAME`|HOSTNAME=fc76e5ff411c.mylabserver.com|

```bash
if [[ $SHELL =~ ^bash$ ]]
tnen
    echo "Do something"
fi
```

<br>

### Introducing Bash Functions
- Simply put, a function in Bash (or pretty much any programming language) is used to group code in a logical way.

```bash
#!/bin/bash
function quit {
    #Do Cleanup Stuff
    exit
    }

# You can use () instead of 'function' declaration
hello () {
    #Do Script Initialization Stuff
    echo Hello!
    }
hello
quit
```

- Function with parameters from argvar
> Run this script with `./function.sh Alex 31`
```bash
#!/bin/bash
USER=$1
AGE=$2

echo "$USER is $AGE years old"
```

- Overwrite system functions within script
```bash
#!/bin/bash

ls (){
    command ls -alt
}

ls
```

### Variable scopes
```bash
#!/bin/bash

VAR1="ABC"

function init {
    VAR2="DEF"
    local VAR3="GHI"
    echo "Inside the function: $VAR[1-3]" #ABCDEFGHI
}

echo "Outside of the function $VAR[1-3]" #ABCDEF
```
> NOTE<br>
>Variable VAR2 is visible outside of the function, however, the function has to be called first, for VAR2 to be initialized and declared.<br>
>The `local VAR3` is only visible inside of the function


## Working with Arrays in Bash

- Initialization

    ```bash
    NUMBERS=(1 2 3 4 5)
    ```

- Array operations
    ```bash
    #Print first element
    echo $NUMBERS
    #1

    #Print element at index 3
    echo ${NUMBERS[2]}
    #3

    #Print all content of the array
    echo ${NUMBERS[@]}
    # 1 2 3 4 5

    #Checkthe length of the array 
    echo ${#NUMBERS[@]}
    5

    #Add elements 
    NUMBERS+=(6 7)
    # 1 2 3 4 5 6 7

    #Print all indexes available within the array
    echo ${!NUMBERS[@]}
    # 0 1 2 3 4 5 6

    #Returns the range of values from the array by providing starting index, and number of values (inclusive)
    echo ${NUMBERS[@]:2:3}
    #3 4 5

    # print from index (starting) until the end of array
    echo ${NUMBERS[@]:3}
    #4 5 6 7
    ```

<br><br><br><br>
## Substitutions
## Command Substitutions
Command substitution in Bash allows you to replace a command with its output. This can be achieved using the `$(command)` syntax or the backticks `\```. Here's a short description with examples:

- **Using `$(command)`**:
    
    The $(command) syntax allows you to capture the output of a command and use it in another context, such as assigning it to a variable or incorporating it into a larger command.

    - ___Example 1: Assign Output to Variable:___

        ```bash
        current_date=$(date)
        echo "Today is $current_date"
        ```
        This captures the current date using the date command and assigns it to the current_date variable.

    - ***Example 2: Command Substitution in a Command***:
        ```bash
        files_in_directory=$(ls)
        echo "Files in the directory: $files_in_directory"
        ```
        This captures the list of files in the current directory using ls and incorporates it into the echo command.

- **Using Backticks ``**:

    Backticks **``** (grave accents) are an older syntax for command substitution. While $(command) is recommended for better readability and nesting, backticks still work.

    - ***Example 1: Assign Output to Variable***:

        ```bash
        current_time=`date +%H:%M:%S`
        echo "Current time is $current_time"
        ```

        This captures the current time using date and assigns it to the current_time variable.

    - ***Example 2: Command Substitution in a Command***:

        ```bash
        count_files=`ls -l | wc -l`
        echo "Number of files in the directory: $count_files"
        ```
        This captures the count of files in the current directory using ls -l | wc -l and incorporates it into the echo command.


<br>

> **NOTE:**<br>
> In modern Bash scripting, it is recommended to use `$(command)` for command substitution due to improved readability and nesting capabilities.

<br><br>
## Process Substitutions

- Process substitution is a feature in Bash that allows you to use the output of a command or a sequence of commands as if it were a file. It's a convenient way to pass the output of a command directly as an argument to another command or process.

### Syntax

Process substitution uses the following syntax:

```bash
<(command)
```
or

```bash
>(command)
```

The `<()` syntax is used for command substitution, while `>()` is used for command substitution with output redirection.

- Example 1: Command Substitution

    In this example, we'll use process substitution to pass the sorted output of a command to another command:

    ```bash
    diff <(sort file1) <(sort file2)
    ```
    Here, `<(sort file1)` and `<(sort file2)` are replaced with file-like references to the sorted outputs of sort file1 and sort file2, respectively. The diff command then compares the two sorted outputs.

<br><br>
- Example 2: Command Substitution with Output Redirection

    You can also use process substitution with output redirection. In this example, we'll redirect the output of a command to a file using process substitution:

    ```bash
    echo >(date) > output.txt
    ```
    Here, `>(date)` is replaced with a file-like reference to the output of the date command, and the echo command writes that reference to output.txt.
<br><br>
> **Note** <br>
> Keep in mind that process substitution is a feature specific to Bash and may not be available in other shells. It provides a convenient and concise way to work with command outputs in scenarios where traditional command substitution with backticks or `$()` may not be suitable.


## Flow Controls

### Using the for Loop

```bash
#!/bin/bash
for i in $(ls); do
    echo item: $i
done
```

```bash
BACKUP_LOC="/home/$USER/work"
BACKUP_TARGET="/home/$USER/work_backup"
LOGFILE="/home/$USER/backup_log"

echo "Copying Files" >> backup_log

cd $BACKUP_LOC
for i in $ (ls); do
    cp -V $1 $BACKUP_TARGET/$i-backup >> $LOGFILE 2>&1
done
```
### Using the while or until Loop

- `while`

    Will execute **while** condition is TRUE

    ```bash
    #!/bin/bash
    COUNTER=0
    while [ $COUNTER -lt 10 ]; do
        echo "The counter is $COUNTER"
        let COUNTER=COUNTER+1
    done
    ```

- `until`

    Will execute **until** test-command returns TRUE, or in other words, while condition evaluates to FALSE
  ```bash
    #!/bin/bash
    COUNTER=20
    until [ $COUNTER -lt 10 ]; do
        echo The counter is $COUNTER
        let COUNTER-=1
    done
  ```
  In example above, loop will run until `$COUNTER eq 9`
### Handling Signals and Traps

- **Signals**
    
    Programs in Linux are managed partially by **signals** from kernel.

    > **Most common signals :**<br>
    > SIGKILL<br>
    > SIGINT<br>
    > SIGTERM<br>
    > SIGUSR1

- Script below is example of signal trap (SIGINT)

 Note: 
 - **SIGINT** does not always behave this way. In general, though, this behaviour is accurate. 
 - You cannot trap **SIGKILL**. Much like pulling the plug from a server is a last resort, **SIGKILL** is special in that it cannot be trapped. If you must resort to **SIGKILL**, something else has gone terribly wrong.  
```bash
#!/bin/bash
ctrlc=0

function trap_ctrlc {
    let ctrlc++
    echo
    if [[ $ctrlc == 1 ]]; then
        echo "Stop doing that. "
    elif [[ $ctrlc == 2 ]]; then
        echo "I warned you... "
    else
        echo "Throwing in the towel. "
        exit
    fi
}

trap trap_ctrlc SIGINT

while true
do
    echo Sleeping. ..
    sleep 10
done
```

### Using Exit Status, Tests, and Builtins

- **Testin with Parentheses**

    - The `if` statement will act on the exit status of the list of commands
    - Parentheses let you run the command in the sub-shell, rather than the shell you are currently in.
    - `then` statement will run if the `if` statement returns true (in this case an exit status of zero).
    - `else` statement will run if the `if` statement returns false (in this case, an exit status of non-zero).

    ```bash
    #!/bin/bash

    if (list of commands)
    then
        command1
    else
        command2
    fi
    ```

- **Testing with square brackets**

    - If your test condition does not return exit status (i.e. comparing two varaibles), you then use saure brackets `[ ]`

    ```bash
    if [ $VAR1 -eq $VAR2 ]
    then . . . 
        . . .
    ```

- **Builtins**

    - There are several Bash builtins
        
        While some of these may be familiar, including those we've covered so far in this course, there are many more Bash builtins.

    - Even builtins have man pages

        `man BUILTIN` will bring up the builtin man page and give you more information about any specific command. 



<br><br><br>

## Learning about Heredocs
### What Is a Heredoc?



### What Is a Herestring?




## Debugging Bash Scripts
### Using Bash Builtins to Troubleshoot Problems: Part 1



### Using Bash Builtins to Troubleshoot Problems: Part 2




## Quick and Dirty Regex in Bash
### What Is Regex?



### How Does Bash Regex Work?

