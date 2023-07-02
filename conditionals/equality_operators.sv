module EqualityOperators;
  reg [3:0] a;
  reg [3:0] b;
  reg logical_equality;
  reg logical_inequality;
  reg case_equality;
  reg case_inequality;

  initial begin
    a = 4'b1010; // Binary representation for decimal 10
    b = 4'b1010; // Binary representation for decimal 10

    // logical equality/inequality
    logical_equality = (a == b); // should return true, or 1
    logical_inequality = (a != b); // should return false, or 0

    // case equality/inequality
    case_equality = (a === b); // should return true, or 1
    case_inequality = (a !== b); // should return false, or 0

    // Print results
    $display("Logical Equality: %b", logical_equality);
    $display("Logical Inequality: %b", logical_inequality);
    $display("Case Equality: %b", case_equality);
    $display("Case Inequality: %b", case_inequality);

    a = 4'b101x; // Binary representation for decimal 10 with an unknown bit
    b = 4'b1010; // Binary representation for decimal 10

    // logical equality/inequality
    logical_equality = (a == b); // should return x
    logical_inequality = (a != b); // should return x 

    // case equality/inequality
    case_equality = (a === b); // should return false, or 0
    case_inequality = (a !== b); // should return true, or 1

    // Print results
    $display("Logical Equality: %b", logical_equality);
    $display("Logical Inequality: %b", logical_inequality);
    $display("Case Equality: %b", case_equality);
    $display("Case Inequality: %b", case_inequality);
  end
endmodule

