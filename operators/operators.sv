//// indexed part select
  // data[base += width]

  reg [31:0] dword;
  reg [7:0] byte0;
  reg [7:0] byte1;
  reg [7:0] byte2;
  reg [7:0] byte3;

  assign byte0 = dword[0 +: 8];    // Same as dword[7:0]
  assign byte1 = dword[8 +: 8];    // Same as dword[15:8]
  assign byte2 = dword[16 +: 8];   // Same as dword[23:16]
  assign byte3 = dword[24 +: 8];   // Same as dword[31:24]

  // another example

  logic [7:0] data = 8'hA5; // 1010_0101
  logic [2:0] slice;

  assign slice = data[3 +: 3]; // This selects bits 3, 4, and 5, resulting in 010
  // or
  assign slice = data[5 -: 3]; // This selects bits 5, 4, and 3, resulting in 010

  // don't think vars allowed on RHS, def allowed on LHS 
  // this move is good for parametric code
  
  // This is illegal due to the variable i, even though the width is always 8 bits
  assign byte = dword[(i*8)+7 : i*8];  // ** Not allowed!

// Use the indexed part select 
  assign byte = dword[i*8 +: 8];

