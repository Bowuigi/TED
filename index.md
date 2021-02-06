## TED

The Text EDitor for quick and easy automation

**TED** is a CLI text editor made in Pure Lua that is useful for automating tasks that require text editing

#Features

- Read files
- Append to files
- Replace *patterns* (Compatible with Lua's gsub) on files
- Infinite argument support
- Compatible with cowsay, lolcat and similar

#Run

To run TED, you need two things:
1. A CLI (Terminal) or similar
2. Lua (5.1+) or LuaJIT

To run it, type: 
```bash

lua/luajit [path to ted.lua] [arguments]
```
You can also make an alias for .bashrc or similar by typing (assuming you use luajit and bash and ted.lua is located on /home/):
```bash

alias ted="luajit ~/ted.lua"

```

#Usage (assuming it is already aliased)

```bash

ted ((-h/-?/--help)(-a/--append)(-r/-read)(-R/--replace)) [filename (required if mode is not help)] [strings to add if mode is append or pattern to match if mode is replace] [string to replace with (if mode is replace)] [//n for whitespaces (if needed)]
```
