# Makefile for Verilog compilation

# Define the source files and the output file name
SRCS = sipo_w_tb.sv 
OUTPUT = sipo_w_sv.vpp

# Define the simulator command
SIMULATOR = iverilog

# Define the simulator options
SIM_OPTIONS = -o $(OUTPUT)

.PHONY: all clean

all: $(OUTPUT)

$(OUTPUT): $(SRCS)
	$(SIMULATOR) $(SIM_OPTIONS) $(SRCS)

clean:
	rm -f $(OUTPUT)

