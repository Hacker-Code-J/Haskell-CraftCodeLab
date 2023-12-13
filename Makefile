# Makefile for Haskell DLP Decoder Project

# Compiler
HC = ghc

# Compiler flags
HFLAGS = -O2

# Source files
SOURCES = DLPDecoder.hs Main.hs

# Main Haskell file
MAIN = Main.hs

# Binary output
EXECUTABLE = DLPDecoder

# Default target
all: $(EXECUTABLE)

# Rule for building the executable
$(EXECUTABLE): $(SOURCES)
	$(HC) $(HFLAGS) $(MAIN) -o $(EXECUTABLE)

# Clean up
clean:
	rm -f *.o *.hi $(EXECUTABLE)

rebuild: clean all

# Phony targets
.PHONY: all clean