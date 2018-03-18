module contador_de_programa(clk, reset, inta, addrin, addrout);

	input clk;										// clock
	input reset;									// reset
	input inta;										// interrupt acknowledge
	input [25:0] addrin;							// in address
	
	output reg [25:0] addrout;					// out address
	
	always @ (posedge clk) begin
		addrout <= reset | inta ? 26'b0 : addrin;
	end
endmodule
