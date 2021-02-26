`timescale 1ns / 1ps
`define BIT_SIZE [7:0]

module DIV_datapath (cmp, data, clear, ldA, ldB, sel, upQ, clk);
	output cmp;
	input `BIT_SIZE data;
	input clear, ldA, ldB, sel, upQ, clk;
	wire `BIT_SIZE A, B, mux_out, sub_result, Quotient, rem;
	
	LOAD A1(A, mux_out, clear, ldA, clk);
	LOAD B1(B, data, clear, ldB, clk);
	COMPARATOR Cmp(cmp, A, B);
	SUBTRACTOR sub(sub_result, clear, A, B);
	COUNTER C(Quotient, clear, upQ, clk);
	MUX M(mux_out, sel, data, sub_result);
	
endmodule