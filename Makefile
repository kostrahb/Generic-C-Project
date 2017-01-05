# IMPORTANT variables
PROGRAMNAME=Hello
SOURCES=main.c hello.c

#locations
SRCDIR=	src
OUTDIR=	bin
TESTDIR=tests

OBJECTS= $(addprefix $(SRCDIR)/, $(SOURCES:.c=.o))
PROGRAM= $(addprefix $(OUTDIR)/, $(PROGRAMNAME))

WARNINGS= -W -Wall -ansi -Wextra -pedantic -Wstrict-overflow=5 -Wshadow -Wpointer-arith -Wcast-qual -Wstrict-prototypes # turn on all possible warnings
COMPILER= -std=gnu89 # -s -march=native -flto -mtune=native -Os -Ofast -ffunction-sections -fdata-sections 		# strip, optimize for performance and then (mainly) for size. After that place all functions and data to separate sections
LINKER= # -flto -Wl,-Map=$(PROGRAM).map,--cref,--gc-section -Wl,--build-id=none		# and with linker delete unneeded ones
DEBUG= -g

export SOURCES
export DEBUG
export COMPILER
export WARNINGS

all: $(PROGRAM)

.PHONY: objects clean
objects:
	$(MAKE) -C $(SRCDIR) all

$(PROGRAM): objects
	cc -o $@ $(OBJECTS) $(DEBUG) $(LINKER)
#	strip -S --strip-all --remove-section=.note.gnu.gold-version --remove-section=.comment --remove-section=.note --remove-section=.note.gnu.build-id --remove-section=.note.ABI-tag $@

clean:
	$(MAKE) -C $(SRCDIR) clean
	$(MAKE) -C $(TESTDIR) clean
	rm -f $(PROGRAM) $(PROGRAM).map
