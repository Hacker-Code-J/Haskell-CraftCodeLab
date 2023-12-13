# Define the Haskell compiler
HASKELL_COMPILER = ghc

# Define the source files and their corresponding output binaries
SOURCES = map_example.hs
BINARIES = $(SOURCES:.hs=)

# Default target to build all binaries
all: $(BINARIES)

# Rule to build Haskell binaries
%: %.hs
	$(HASKELL_COMPILER) -o $@ $<

# Clean target to remove binaries and intermediate files
clean:
	rm -f $(BINARIES) *.hi *.o

# Define phony targets
.PHONY: all clean