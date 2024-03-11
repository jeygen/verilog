class our_driver extends uvm_driver;

    `uvm_component_utils(uvm_driver); // register class with uvm

    // constructor
    function new (string name = "our_driver", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction


endclass: our_driver