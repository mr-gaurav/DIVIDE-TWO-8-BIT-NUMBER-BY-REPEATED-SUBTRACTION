`define BIT_SIZE [7:0]
module COUNTER (count, clear, upcount, clk);
	output reg `BIT_SIZE count;
	input clear, upcount, clk;
	
	always@(posedge clk) begin
		if (clear)
			count<=0;
		else if(upcount)
			count<=count+1;
	end
endmodule