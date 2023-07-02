module sv_function;
  int x;
  //function to add two integer numbers.
  function int sum(input int a,b);
    sum = a+b;   
  endfunction

  initial begin
    x=sum(10,5);
    $display("\tValue of x = %0d",x);
  end
endmodule

// First function declaration style - inline arguments
function <return_type> <name> (input <arguments>);
  // Declaration of local variables
  // Function code
endfunction : <name>


// Second function declaration style - arguments in body
function <return_type> <name>;
  (input <arguments>);
  // Declaration of local variables
  begin // if function is just one statement dont need begin and end statements
    // function code
  end
endfunction
