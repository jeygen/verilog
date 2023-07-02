# Makefile for Verilog compilation

# Define the source files and the output file name
SRCS = $(wildcard *.sv)
OUTPUTS = $(patsubst %.sv,%.vpp,$(SRCS))

# Define the simulator command
SIMULATOR = iverilog

# Define the simulator options
SIM_OPTIONS = -o 

#.PHONY: all clean

all: $(OUTPUTS)

%.vpp: %.sv
	$(SIMULATOR) $(SIM_OPTIONS) $@ $<

clean:
	rm -f $(OUTPUTS)

