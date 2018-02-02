module disco_rigido (clk, we, addr, datain, dataout);
	input clk;										// clock
	input we;										// write enable
	input [31:0] addr;							// disk address
	input [31:0] datain;							// data in (to disk)
	
	output reg [31:0] dataout;					// data out (from disk)
	
	localparam DISK_SIZE = 500;				// Tamanho do disco
	reg [31:0] disk [DISK_SIZE-1:0];			// disk cells
	
	always @ (posedge clk) begin
		if (we) disk[addr] <= datain;			// write disk
	end
	
	always @ (negedge clk) begin
		dataout <= disk[addr];
	end

	initial begin
		// SISTEMA OPERACIONAL
		disk[0] <= 32'b010110_00000000000000000000100000;		// Jump to Main
		disk[1] <= 32'b000001_11110_11110_0000000000000110; 	// addi
		disk[2] <= 32'b010010_11110_00110_1111111111111101; 	// sw
		disk[3] <= 32'b010000_00000_10100_0000000000011000; 	// li
		disk[4] <= 32'b010010_11110_10100_0000000000000000; 	// sw
		disk[5] <= 32'b001111_11110_01010_1111111111111101; 	// lw
		disk[6] <= 32'b010010_11110_01010_1111111111111111; 	// sw
		disk[7] <= 32'b001111_11110_01011_1111111111111111; 	// lw
		disk[8] <= 32'b001110_01011_00110_0000000000000000; 	// mov
		disk[9] <= 32'b011001_00110_10101_0000000000000000; 	// ldk
		disk[10] <= 32'b010010_11110_10101_1111111111111110; 	// sw
		disk[11] <= 32'b001111_11110_01100_1111111111111110; 	// lw
		disk[12] <= 32'b001101_01100_10110_0000000000011010; 	// srli
		disk[13] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[14] <= 32'b000000_10110_01101_10111_00000_001101; 	// ne
		disk[15] <= 32'b010101_10111_00000_0000000000011011; 	// jf
		disk[16] <= 32'b001110_01100_00110_0000000000000000; 	// mov
		disk[17] <= 32'b001110_01011_00111_0000000000000000; 	// mov
		disk[18] <= 32'b011100_00111_00110_0000000000000000; 	// sim
		disk[19] <= 32'b000001_01011_11000_0000000000000001; 	// addi
		disk[20] <= 32'b010010_11110_11000_1111111111111111; 	// sw
		disk[21] <= 32'b001111_11110_01011_1111111111111111; 	// lw
		disk[22] <= 32'b001110_01011_00110_0000000000000000; 	// mov
		disk[23] <= 32'b011001_00110_11001_0000000000000000; 	// ldk
		disk[24] <= 32'b010010_11110_11001_1111111111111110; 	// sw
		disk[25] <= 32'b001111_11110_01100_1111111111111110; 	// lw
		disk[26] <= 32'b010110_00000000000000000000001011; 	// j
		disk[27] <= 32'b001110_01100_00110_0000000000000000; 	// mov
		disk[28] <= 32'b001110_01011_00111_0000000000000000; 	// mov
		disk[29] <= 32'b011100_00111_00110_0000000000000000; 	// sim
		disk[30] <= 32'b001110_01011_00001_0000000000000000; 	// mov
		disk[31] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
		disk[32] <= 32'b000001_11110_11110_0000000000000010; 	// addi
		disk[33] <= 32'b010000_00000_10100_0000000001000000; 	// li
		disk[34] <= 32'b010010_11110_10100_0000000000000000; 	// sw
		disk[35] <= 32'b001111_11110_01010_0000000000000000; 	// lw
		disk[36] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[37] <= 32'b010010_11110_01010_0000000000000000; 	// sw
		disk[38] <= 32'b010111_00000000000000000000000001; 	// jal
		disk[39] <= 32'b001110_00001_01011_0000000000000000; 	// mov
		disk[40] <= 32'b000010_11110_11110_0000000000000110; 	// subi
		disk[41] <= 32'b001111_11110_01010_0000000000000000; 	// lw
		disk[42] <= 32'b010010_11110_01011_1111111111111111; 	// sw
		disk[43] <= 32'b001110_01010_00110_0000000000000000; 	// mov
		disk[44] <= 32'b001111_11110_01100_1111111111111111; 	// lw
		disk[45] <= 32'b001110_01100_00111_0000000000000000; 	// mov
		disk[46] <= 32'b010000_00000_01000_0000000000000001; 	// li
		disk[47] <= 32'b100000_00110_00111_0000000000000001; 	// mmu
		disk[48] <= 32'b010011_00000_10101_0000000000000000; 	// in
		disk[49] <= 32'b010010_11110_10101_1111111111111111; 	// sw
		disk[50] <= 32'b001111_11110_01100_1111111111111111; 	// lw
		disk[51] <= 32'b001110_01100_00110_0000000000000000; 	// mov
		disk[52] <= 32'b000000_00110_00000_00000_00000_010010; 	// jr
		disk[53] <= 32'b011000_00000000000000000000000000; 	// halt

		// MAIOR ELEMENTO
		disk[64] <= 32'b010110_00000000000000000000100011;		// Jump to Main
		disk[65] <= 32'b000001_11110_11110_0000000000000111; 	// addi
		disk[66] <= 32'b010010_11110_00110_1111111111111100; 	// sw
		disk[67] <= 32'b010010_11110_00111_1111111111111101; 	// sw
		disk[68] <= 32'b010000_00000_10100_0000000000000000; 	// li
		disk[69] <= 32'b010010_11110_10100_1111111111111110; 	// sw
		disk[70] <= 32'b010000_00000_10101_0000000000000000; 	// li
		disk[71] <= 32'b010010_11110_10101_0000000000000000; 	// sw
		disk[72] <= 32'b001111_11110_01010_1111111111111110; 	// lw
		disk[73] <= 32'b001111_11110_01011_1111111111111101; 	// lw
		disk[74] <= 32'b000000_01010_01011_10110_00000_001110; 	// lt
		disk[75] <= 32'b010101_10110_00000_0000000000011011; 	// jf
		disk[76] <= 32'b001111_11110_01100_1111111111111100; 	// lw
		disk[77] <= 32'b000000_01100_01010_10111_00000_000000; 	// add
		disk[78] <= 32'b001111_10111_10111_0000000000000000; 	// lw
		disk[79] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[80] <= 32'b000000_01101_10111_11000_00000_001110; 	// lt
		disk[81] <= 32'b010101_11000_00000_0000000000010111; 	// jf
		disk[82] <= 32'b000000_01100_01010_11001_00000_000000; 	// add
		disk[83] <= 32'b001111_11001_11001_0000000000000000; 	// lw
		disk[84] <= 32'b010010_11110_11001_0000000000000000; 	// sw
		disk[85] <= 32'b001111_11110_01101_0000000000000000; 	// lw
		disk[86] <= 32'b010010_11110_01010_1111111111111111; 	// sw
		disk[87] <= 32'b000001_01010_11010_0000000000000001; 	// addi
		disk[88] <= 32'b010010_11110_11010_1111111111111110; 	// sw
		disk[89] <= 32'b001111_11110_01010_1111111111111110; 	// lw
		disk[90] <= 32'b010110_00000000000000000000001000; 	// j
		disk[91] <= 32'b001111_11110_01110_1111111111111111; 	// lw
		disk[92] <= 32'b001110_01110_00110_0000000000000000; 	// mov
		disk[93] <= 32'b010000_00000_00111_0000000000000001; 	// li
		disk[94] <= 32'b010100_00000_00110_0000000000000001; 	// out
		disk[95] <= 32'b001110_01101_00110_0000000000000000; 	// mov
		disk[96] <= 32'b010000_00000_00111_0000000000000010; 	// li
		disk[97] <= 32'b010100_00000_00110_0000000000000010; 	// out
		disk[98] <= 32'b000000_11111_00000_00000_00000_010010; 	// jr
		disk[99] <= 32'b000001_11110_11110_0000000000000110; 	// addi
		disk[100] <= 32'b010001_11110_01010_1111111111111011; 	// la
		disk[101] <= 32'b010000_00000_10100_0000000000001100; 	// li
		disk[102] <= 32'b010010_01010_10100_0000000000000000; 	// sw
		disk[103] <= 32'b010000_00000_10101_0000000000101001; 	// li
		disk[104] <= 32'b010010_01010_10101_0000000000000001; 	// sw
		disk[105] <= 32'b010000_00000_10110_0000000000010111; 	// li
		disk[106] <= 32'b010010_01010_10110_0000000000000010; 	// sw
		disk[107] <= 32'b010000_00000_10111_0000000001100010; 	// li
		disk[108] <= 32'b010010_01010_10111_0000000000000011; 	// sw
		disk[109] <= 32'b010000_00000_11000_0000000000100001; 	// li
		disk[110] <= 32'b010010_01010_11000_0000000000000100; 	// sw
		disk[111] <= 32'b010000_00000_11001_0000000000010101; 	// li
		disk[112] <= 32'b010010_01010_11001_0000000000000101; 	// sw
		disk[113] <= 32'b010001_11110_00110_1111111111111011; 	// la
		disk[114] <= 32'b010000_00000_00111_0000000000000110; 	// li
		disk[115] <= 32'b010111_00000000000000000000000001; 	// jal
		disk[116] <= 32'b001110_00001_01011_0000000000000000; 	// mov
		disk[117] <= 32'b000010_11110_11110_0000000000000111; 	// subi
		disk[118] <= 32'b011000_00000000000000000000000000; 	// halt

	end
endmodule
