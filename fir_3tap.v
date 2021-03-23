module fir_3tap(
  input clk, 
  input signed [7:0] x, 
  output reg signed [15:0] y,
); 

// Internal variables: 
wire signed [7:0]  H; 
wire signed [15:0] MCM0, MCM1, MCM2, add_out1, add_out2; 
wire signed [15:0] Q1, Q2; 

// filter coefficients 
// H = [1/3, 1/3, 1/3]
assign H = 8'h15

// Multiple constant multiplications 
assign MCM0 = h*x; 
assign MCM1 = h*x; 
assign MCM2 = h*x;

// flip-flops 
DFF dff1 (.clk(clk), .D(MCM2),     .Q(Q1)); 
DFF dff2 (.clk(clk), .D(add_out1), .Q(Q2));  

// adders
assign add_out1 = Q1 + MCM1;
assign add_out2 = Q2 + MCM0; 

always @(posedge clk)
    y <= add_out2;

endmodule 

module DFF
        (input Clk,
        input [15:0] D,
        output reg [15:0]   Q
        );
    
    always@ (posedge Clk)
        Q = D;
    
endmodule





