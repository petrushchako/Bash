# Output Redirection in Bash
In Bash, commands can produce two main types of output:
- **`stdout` (Standard Output)** – Normal command output
- **`stderr` (Standard Error)** – Error messages

By default, both are displayed in the terminal, but you can **redirect** them to files or other locations.

### Standard Output (stdout)
- File descriptor: `1` (default)

```bash
echo "Hello world" > output.txt
```

- Redirects stdout to `output.txt`
- Equivalent to:

```bash
echo "Hello world" 1> output.txt
```

### Standard Error (stderr)
- File descriptor: `2`

```bash
ls /not/exist 2> error.log
```

- Redirects only error messages to `error.log`

### Redirect Both stdout and stderr
```bash
some_command > all.log 2>&1
```

- `>` redirects stdout to `all.log`
- `2>&1` sends stderr to the same place as stdout

Another option:

```bash
some_command &> all.log
```


#### Discard Output with `/dev/null`

`/dev/null` is a special file that discards everything written to it.

- Discard stdout:

```bash
some_command > /dev/null
```

- Discard stderr:

```bash
some_command 2> /dev/null
```

- Discard both:

```bash
some_command > /dev/null 2>&1
```

### Example: Writing to stderr

```bash
echo "This is an error message" >&2
```

- `>&2` explicitly sends the message to stderr.

### Summary of Common Redirections

| Purpose         | Command                    |
| --------------- | -------------------------- |
| Redirect stdout | `command > file`           |
| Redirect stderr | `command 2> file`          |
| Redirect both   | `command > file 2>&1`      |
| Discard stdout  | `command > /dev/null`      |
| Discard stderr  | `command 2> /dev/null`     |
| Discard both    | `command > /dev/null 2>&1` |
