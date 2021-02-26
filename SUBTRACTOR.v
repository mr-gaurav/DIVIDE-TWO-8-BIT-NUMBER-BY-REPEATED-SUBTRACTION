module SUBTRACTOR(out, clear, in1, in2);
	output reg `BIT_SIZE out;
	input `BIT_SIZE in1, in2;
	input clear;
	
	always@(*) begin
		if (clear)
			out<=0;
		else 
			out<= in1-in2;
	end
endmodule