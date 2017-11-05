module memoria_de_instrucoes(pc, instrucao);
	// Entrada
	input [25:0] pc;				// PC Atual
	
	// Saida
	output [31:0] instrucao;	// Proxima instrucao a ser executada
	
	parameter MEM_SIZE = 150; // Tamanho da memoria
	wire [31:0] rom [MEM_SIZE-1:0];// Memoria de instrucoes

	assign rom[0] = 32'b010110_00000000000000000000101110;		// Jump to Main
	assign rom[1] = 32'b000001_11110_11110_0000000000001000; 	// addi
	assign rom[2] = 32'b010010_11110_00110_1111111111111011; 	// sw
	assign rom[3] = 32'b010010_11110_00111_1111111111111100; 	// sw
	assign rom[4] = 32'b010000_00000_10100_0000000000000000; 	// li
	assign rom[5] = 32'b010010_11110_10100_1111111111111101; 	// sw
	assign rom[6] = 32'b001111_11110_01010_1111111111111100; 	// lw
	assign rom[7] = 32'b000010_01010_10101_0000000000000001; 	// subi
	assign rom[8] = 32'b001111_11110_01011_1111111111111101; 	// lw
	assign rom[9] = 32'b000000_01011_10101_10110_00000_001110; 	// lt
	assign rom[10] = 32'b010101_10110_00000_0000000000101101; 	// jf
	assign rom[11] = 32'b010010_11110_01011_1111111111111111; 	// sw
	assign rom[12] = 32'b000001_01011_10111_0000000000000001; 	// addi
	assign rom[13] = 32'b010010_11110_10111_1111111111111110; 	// sw
	assign rom[14] = 32'b001111_11110_01100_1111111111111110; 	// lw
	assign rom[15] = 32'b000000_01100_01010_11000_00000_001110; 	// lt
	assign rom[16] = 32'b010101_11000_00000_0000000000011101; 	// jf
	assign rom[17] = 32'b001111_11110_01101_1111111111111011; 	// lw
	assign rom[18] = 32'b000000_01101_01100_11001_00000_000000; 	// add
	assign rom[19] = 32'b001111_11001_11001_0000000000000000; 	// lw
	assign rom[20] = 32'b001111_11110_01110_1111111111111111; 	// lw
	assign rom[21] = 32'b000000_01101_01110_11010_00000_000000; 	// add
	assign rom[22] = 32'b001111_11010_11010_0000000000000000; 	// lw
	assign rom[23] = 32'b000000_11001_11010_11011_00000_001110; 	// lt
	assign rom[24] = 32'b010101_11011_00000_0000000000011010; 	// jf
	assign rom[25] = 32'b010010_11110_01100_1111111111111111; 	// sw
	assign rom[26] = 32'b000001_01100_11100_0000000000000001; 	// addi
	assign rom[27] = 32'b010010_11110_11100_1111111111111110; 	// sw
	assign rom[28] = 32'b010110_00000000000000000000001110; 	// j
	assign rom[29] = 32'b001111_11110_01111_1111111111111111; 	// lw
	assign rom[30] = 32'b000000_01011_01111_11101_00000_001101; 	// ne
	assign rom[31] = 32'b010101_11101_00000_0000000000101010; 	// jf
	assign rom[32] = 32'b000000_01101_01011_10100_00000_000000; 	// add
	assign rom[33] = 32'b001111_10100_10100_0000000000000000; 	// lw
	assign rom[34] = 32'b010010_11110_10100_0000000000000000; 	// sw
	assign rom[35] = 32'b000000_01101_01111_10101_00000_000000; 	// add
	assign rom[36] = 32'b001111_10101_10101_0000000000000000; 	// lw
	assign rom[37] = 32'b000000_01101_01011_10110_00000_000000; 	// add
	assign rom[38] = 32'b010010_10110_10101_0000000000000000; 	// sw
	assign rom[39] = 32'b000000_01101_01111_10111_00000_000000; 	// add
	assign rom[40] = 32'b001111_11110_10000_0000000000000000; 	// lw
	assign rom[41] = 32'b010010_10111_10000_0000000000000000; 	// sw
	assign rom[42] = 32'b000001_01011_11000_0000000000000001; 	// addi
	assign rom[43] = 32'b010010_11110_11000_1111111111111101; 	// sw
	assign rom[44] = 32'b010110_00000000000000000000000110; 	// j
	assign rom[45] = 32'b000000_11111_00000_00000_00000_010010; 	// jr
	assign rom[46] = 32'b000001_11110_11110_0000000000000101; 	// addi
	assign rom[47] = 32'b010001_11110_01010_1111111111111100; 	// la
	assign rom[48] = 32'b010000_00000_10100_0000000000001001; 	// li
	assign rom[49] = 32'b010010_01010_10100_0000000000000000; 	// sw
	assign rom[50] = 32'b010000_00000_10101_0000000000000110; 	// li
	assign rom[51] = 32'b010010_01010_10101_0000000000000001; 	// sw
	assign rom[52] = 32'b010000_00000_10110_0000000000001000; 	// li
	assign rom[53] = 32'b010010_01010_10110_0000000000000010; 	// sw
	assign rom[54] = 32'b010000_00000_10111_0000000000000111; 	// li
	assign rom[55] = 32'b010010_01010_10111_0000000000000011; 	// sw
	assign rom[56] = 32'b010001_11110_00110_1111111111111100; 	// la
	assign rom[57] = 32'b010000_00000_00111_0000000000000100; 	// li
	assign rom[58] = 32'b010111_00000000000000000000000001; 	// jal
	assign rom[59] = 32'b001110_00001_01011_0000000000000000; 	// mov
	assign rom[60] = 32'b000010_11110_11110_0000000000001000; 	// subi
	assign rom[61] = 32'b010011_00000_11000_0000000000000000; 	// in
	assign rom[62] = 32'b010010_11110_11000_0000000000000000; 	// sw
	assign rom[63] = 32'b010001_11110_01100_1111111111111100; 	// la
	assign rom[64] = 32'b001111_11110_01101_0000000000000000; 	// lw
	assign rom[65] = 32'b000000_01100_01101_11001_00000_000000; 	// add
	assign rom[66] = 32'b001111_11001_11001_0000000000000000; 	// lw
	assign rom[67] = 32'b001110_11001_00110_0000000000000000; 	// mov
	assign rom[68] = 32'b010000_00000_00111_0000000000000010; 	// li
	assign rom[69] = 32'b010100_00000_00110_0000000000000010; 	// out
	assign rom[70] = 32'b011000_00000000000000000000000000; 	// halt

	assign instrucao = rom[pc];
endmodule
