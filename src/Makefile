# Variables. SOURCES is exported from makefile one folder up and so is DEBUG
OBJECTS=$(SOURCES:.c=.o)
PROTO=$(SOURCES:.c=.p)
STATPROTO=$(SOURCES:.c=.sp)
DEPS=$(SOURCES:.c=.d)

# Generate and include dependencies:

all: $(DEPS) $(OBJECTS)

%.o: %.c %.d
	$(CC) $(WARNINGS) $(DEBUG) $(COMPILER) -c -o $@ $<

# Generate dependencies
%.d: %.c
	$(CC) -MM -MG -MF $@ $<

# Generate function prototypes
%.p: %.c
	cproto $< > $@

.PHONY: clean

clean:
	rm -f $(OBJECTS) $(DEPS) $(PROTO) $(STATPROTO)

-include $(DEPS)
