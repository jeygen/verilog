class our_env extends uvm_env;

    `uvm_component_utils(uvm_env); // register class with uvm

    // constructor
    function new (string name = "our_env", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction


endclass: our_env