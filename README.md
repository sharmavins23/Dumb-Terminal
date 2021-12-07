# Dumb Terminal

This project creates a dumb terminal on Raspberry Pi 4 Baremetal. The board will
receive UART transmissions and send them back as quick as possible.

Currently, the project blinks one LED on pin 21. The actual functions are listed
in assembly code, and the program calls C code to compile it.

## Project TO-DO:

- Set up UART initialization and serial communication through C libraries and
  utils
- Redo the makefile to not have code everywhere in the root filespace
- Compile objects into an objects folder, such that only the objects folder can
  be loaded
- Figure out which ISA this is using (probably only T32, have to check GNU
  toolchains)

# License TL;DR

This project is distributed under the MIT license. This is a paraphrasing of a
[short summary](https://tldrlegal.com/license/mit-license).

This license is a short, permissive software license. Basically, you can do
whatever you want with this software, as long as you include the original
copyright and license notice in any copy of this software/source.

## What you CAN do:

- You may commercially use this project in any way, and profit off it or the
  code included in any way;
- You may modify or make changes to this project in any way;
- You may distribute this project, the compiled code, or its source in any way;
- You may incorporate this work into something that has a more restrictive
  license in any way;
- And you may use the work for private use.

## What you CANNOT do:

- You may not hold me (the author) liable for anything that happens to this code
  as well as anything that this code accomplishes. The work is provided as-is.

## What you MUST do:

- You must include the copyright notice in all copies or substantial uses of the
  work;
- You must include the license notice in all copies or substantial uses of the
  work.

If you're feeling generous, give credit to me somewhere in your projects.
