class our_agent extends uvm_agent;

    `uvm_component_utils(uvm_agent); // register class with uvm

    // constructor
    function new (string name = "our_agent", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction


endclass: our_agent