// Virtual functions allow a parent to use the kid's version of the function

class BaseClass;
    // Declare a virtual function
    virtual function void printMessage();
        $display("This is the base class message.");
    endfunction
endclass

class DerivedClass extends BaseClass;
    // Override the virtual function
    virtual function void printMessage();
        $display("This is the derived class message.");
    endfunction
endclass

module Test;
    BaseClass base;
    DerivedClass derived;

    initial begin
        base = new;
        derived = new;
        
        base.printMessage();    // Will display: "This is the base class message."
        derived.printMessage(); // Will display: "This is the derived class message."
        
        base = derived; // Assign derived object to base
        base.printMessage(); // Will display: "This is the derived class message."
    end
endmodule

