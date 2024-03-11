class our_sequencer extends uvm_sequencer;

    `uvm_component_utils(uvm_sequencer); // register class with uvm

    // constructor
    function new (string name = "our_sequencer", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction


endclass: our_sequencer