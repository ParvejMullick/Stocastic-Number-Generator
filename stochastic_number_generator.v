`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:44:14 05/10/2023 
// Design Name: 
// Module Name:    stochastic_number_generator 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module stochastic_number_generator(
    input clk,
    input rst,
    input [4:1] X1,
	 input [4:1] X2,
	 input [4:1] X3,
    output reg [4:1] L,
    output SBS
    );

 wire fb;
 wire cmp_result1;
 wire cmp_result2;
 wire cmp_result3;
 reg cmp_result2_branch;
 reg cmp_result3_branch1;
 reg cmp_result3_branch2;

 assign cmp_result1 = (L < X1);
 assign cmp_result2 = (L < X2);
 assign cmp_result3 = (L < X3);
 always @(posedge clk, posedge rst)
 begin
 if(rst)
      cmp_result2_branch = 1'b0;
 else 
     cmp_result2_branch = cmp_result2;
end
always @(posedge clk, posedge rst)
 begin
 if(rst)
     cmp_result3_branch1 = 1'b0;
 else 
     cmp_result3_branch1 = cmp_result3;
end

always @(posedge clk, posedge rst)
 begin
 if(rst)
     cmp_result3_branch2 = 1'b0;
 else 
     cmp_result3_branch2 = cmp_result3_branch1;
end
 
 assign SBS = cmp_result1 & cmp_result2_branch & cmp_result3_branch2;
 assign fb = ~(L[3] ^ L[4]);
 always @(posedge clk, posedge rst)
 begin
 if(rst)
  L = 4'b0;
  else
  L = {L[3:1], fb};
 end
endmodule
