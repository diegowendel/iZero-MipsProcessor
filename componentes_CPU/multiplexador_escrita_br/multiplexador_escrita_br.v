module multiplexador_escrita_br(entrada_dados, memoria_dados, ULA, PC, ctrl_mux_escrita_br, dadoEscrito);
	// ----------Portas de Entrada---------- //
	input [31:0] entrada_dados; // Dado vindo da entrada de dados
	input [31:0] memoria_dados; // Dado vindo da memoria de dados	
	input [31:0] ULA;	// Dado vindo da ULA
	input [25:0] PC; // PC para linkar endereco antes de chamar uma funcao
	
	// ----------Portas de Saida---------- //
	output reg [31:0] dadoEscrito; // Dado que sera escrito nos registradores
	
	// ----------Controle---------- //
	input [1:0] ctrl_mux_escrita_br; // Sinal de controle vindo da UC

	always @ (*) begin
		case(ctrl_mux_escrita_br)
			2'b00: dadoEscrito = PC + 32'd1;
			2'b01: dadoEscrito = ULA;
			2'b10: dadoEscrito = memoria_dados;
			2'b11: dadoEscrito = entrada_dados;
		endcase
	end
endmodule
