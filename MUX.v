module MUX (out, sel, in1, in2);
	output reg `BIT_SIZE out;
	input sel;
	input `BIT_SIZE in1, in2;
	
	always@ (*) begin
		out= sel ? in1 : in2;
	end
endmodule
