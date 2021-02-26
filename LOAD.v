`define BIT_SIZE [7:0]
module LOAD (out, in, clear, load, clk);
	output reg `BIT_SIZE out;
	input `BIT_SIZE in;
	input clear, load, clk;
	
	always@(posedge clk) begin
		if(clear)
			out<=0;
		else if(load)
			out<=in;
	end
endmodule