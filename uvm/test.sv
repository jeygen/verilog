class our_test extends uvm_test; // for test component, uvm_test from uvm_pkg

    // register class with uvm factory, think like uvm library
    `uvm_component_utils(our_test);

    // constructor
    // uvm loves having name and parent in constructors
    // tests are often top level, so null parent default makes sense
    // null default increases flexibility 
    function new (string name = "our_test", uvm_component parent = null);
        super.new(name, parent); // calling super in contructors is the norm in uvm
    endfunction



endclass