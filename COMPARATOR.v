`define BIT_SIZE [7:0]
module COMPARATOR (out, in1, in2);
	output reg out;
	input `BIT_SIZE in1, in2;
	always@(*) begin
		if(in1 >= in2)
			out=1;
		else 
			out=0;
	end
endmodule
