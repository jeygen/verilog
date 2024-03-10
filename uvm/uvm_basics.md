uvm (universal verification methodology)
  - framework of reusable system verilog classes
  -    guides what, when, and where to test a design
  -    set of rules and tools beyond specific company
  -    tb can be reused with similar designs

components and objects
  - comps at 0 to infinite time
    - top, test, env, agent, seqr driver, monitor
  - objects are transient
    - seq, packet
  - top contains -> test, dut
    - test contains -> env, packet, sequences
    - env contains -> scoreboard, agent
      - agent contains -> monitor, seq, driver
  - info flows from packet -> sequences -> sequencer -> driver -> dut -> monitor -> scoreboard
