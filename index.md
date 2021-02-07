The Text EDitor for quick and easy automation

**TED** is a CLI text editor made in Pure Lua that is useful for automating tasks that require text editing

Features
---

- Read files
- Append to files
- Replace *patterns* (Compatible with Lua's gsub) on files
- Infinite argument support
- Compatible with cowsay, lolcat and similar

Run
---

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

Usage (assuming it is already aliased)
---

```bash
ted ((-h/-?/--help)(-a/--append)(-r/-read)(-R/--replace)) [filename (required if mode is not help)] [strings to add if mode is append or pattern to match if mode is replace] [string to replace with (if mode is replace)] [//n for whitespaces (if needed)]
```
Examples
---
Anyway, here are some of them:

First we create a file with the name example.txt that contains "hello world"
```bash
ted -a example.txt "hello world"
```
That outputs: "TED:Finished", this command is always printed at the end of the program

So now we read the content:

```bash
ted -r example.txt
```
That outputs:
hello world
TED:Finished

So now to the crazy stuff

Replacements
---

Since it works like lua's string.gsub functions, so you can find more on the lua docs

We will use the same file (example.txt)

Normal replacements

```bash
ted -R example.txt o 0
```

If we read the file like we did before we will see that the content is now "hell0 w0rld"

Moving letters in each word

```bash
ted -R example.txt "([^%s])([^%s]*)" "%2%1"
```

Reading the file, the content is now "ell0h 0rldw"

Replacing every word to whatever you want

For this one i will make a separate file named "word.txt" that contains: "hello, how are you?"

```bash
ted -R word.txt "[^%s]+" word
```

Reading the file, the content is "word, word word word?"

Very big replacements (200mb) on ted take ≈10 seconds, while most normal text editors just crash when trying to access it

This and much more can be done in ted in a fast and reliable way
