module DIV_controller (done, clear, ldA, ldB, sel, upQ, cmp, start, clk);
	output reg done, clear,  ldA, ldB, sel, upQ;
	input cmp, start, clk;
	reg [2:0] state;
	parameter s0=0, s1=1, s2=2, s3=3, s4=4;
	
	always@ (posedge clk) begin
		case (state)
			s0: if (start) state<=s1;
			s1: #1 state<=s2;
			s2: #1 state<=s3;
			s3: begin #1 if(!cmp) state<=s4; end
			s4: #1 state<= s4;
			default: state<=s0;
		endcase
	end
	
	always@ (state) begin
		case(state)
			s0: begin done=0; clear=1; ldA=0; ldB=0; sel=1; upQ=0; end
			s1: begin clear=0; ldA=1; end
			s2: begin ldA=0; ldB=1; end
			s3: begin ldB=0; sel=0; ldA=1; upQ=1; end
			s4: begin sel=1'bx; ldA=0; upQ=0; done=1; end
			default: begin done=1'bx; clear=1'bx; ldA=1'bx; ldB=1'bx; sel=1'bx; upQ=1'bx; end
		endcase	
	end
endmodule