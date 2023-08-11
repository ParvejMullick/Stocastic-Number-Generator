`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   01:45:49 05/10/2023
// Design Name:   stochastic_number_generator
// Module Name:   D:/Mini Project/FPGA_PROJECT/sng_test_bench.v
// Project Name:  FPGA_PROJECT
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: stochastic_number_generator
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sng_test_bench;

	// Inputs
	reg clk;
	reg rst;
	reg [4:1] X1;
	reg [4:1] X2;
	reg [4:1] X3;

	// Outputs
	wire [4:1] L;
	wire SBS;

	// Instantiate the Unit Under Test (UUT)
	stochastic_number_generator uut (
		.clk(clk), 
		.rst(rst), 
		.X1(X1), 
		.X2(X2), 
		.X3(X3), 
		.L(L), 
		.SBS(SBS)
	);

	initial begin
		X1 = 7;
		X2 = 5;
		X3 = 4;
      clk = 1'b0;
		rst = 1;
      #50
		rst = 0;
		// Wait 100 ns for global reset to finish
		//#100;
		forever begin
		#100 clk= ~clk;
       end 
        
        
		// Add stimulus here

	end
      
endmodule

