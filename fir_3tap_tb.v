module fir_3tap_tb;

    // Inputs
    reg clk;
    reg signed [7:0] x;   // NOTE: Q3.4

    // Outputs
    wire signed [15:0] y; // NOTE: Q5.10

    // Instantiate the Unit Under Test (UUT)
    fir_3tap uut (
        .clk(clk), 
        .x(y), 
        .y(y)
    );
    
    //Generate a clock with 10 ns clock period.
    initial clk = 0;
    always #5 clk =~clk;

//Initialize and apply the inputs.
// TODO: Need to check the y. 
    initial begin
          x = 8'h20;  #40; // x = 2
          x = 8'h40;  #10; // x = 4 
          x = 8'h60;  #10; // x = 6 
          x = 8'h40;  #10; // x = 4
          x = 8'h20;  #10; // x = 2
          x = 8'h00;  #10; // x = 0 
          x = 8'h00;  #10; // x = 0 
          x = 8'h00;  #10; // x = 0
    end
endmodule