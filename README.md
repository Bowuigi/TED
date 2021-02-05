# TED
TED is a simple CLI Text EDitor made in pure Lua

Useful for quick and easy automation.

Run instructions
-----
After downloading the file run or alias (Lua/luajit) (path to file) (arguments)
You can also alias it by putting this in your .bashrc or similar:
```bash

alias ted="[luajit/lua] [path to ted]"
```

Usage
-----
ted ((-r/--read),(-a/--append),(-R/--replace)) [file (needed always except on -h)] [string to add if -a or pattern to match if -R] [more strings or //n or strings to replace to if pattern is matched] ...

Newlines need to be in a separate argument (same command) but strings don't have almost any restrictions



Also the program doesn't add spaces between different arguments on the file

The program always writes at the end of a file on append (-a/--append) mode

TED is compatible with lua's gsub patterns on replace mode
