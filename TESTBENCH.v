module DIV_TEST;
	reg clk, start;
	reg [7:0] data;
	wire done;
	
	DIV_datapath dut1(cmp, data, clear, ldA, ldB, sel, upQ, clk);
	DIV_controller dut2(done, clear, ldA, ldB, sel, upQ, cmp, start, clk);
	
	always #5 clk=~clk;
	initial begin
		clk=0;
		$dumpfile("DIVISION.vcd");
		$dumpvars(0,DIV_TEST);
		$monitor ("time=%g, A=%d, B=%d, Quotient=%d, remainder=%d, done=%b,", $time, dut1.A, dut1.B, dut1.Quotient, dut1.A, done);
		
		#1 start=1;
		#3 data=100;
		#25 data=23;
		#1000 $finish;
	end
endmodule