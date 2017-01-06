# Generic-C-Project
C Project structure I use, with makefiles and examle program.

It uses cproto and gcc -MM to automatically generate function prototypes from <file.c> to <file.p> and dependencies to <file.d>

Usage: It obviously needs cproto and gcc. Otherwise you need to fill all source files to main Makefile and if you want
automatically generated function prototypes in <file.h> just include <file.p> there
