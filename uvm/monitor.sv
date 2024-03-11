class our_monitor extends uvm_monitor;

    `uvm_component_utils(uvm_monitor); // register class with uvm

    // constructor
    function new (string name = "our_monitor", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction


endclass: our_monitor