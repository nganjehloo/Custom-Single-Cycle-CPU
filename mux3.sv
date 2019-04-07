module mux3(input wire [2:0] select, input logic [4:0] instruct, output logic [4:0] rda_val_o);

	always_comb begin
		case(select)
			0: rda_val_o = 5'h08; //r8
			1: rda_val_o = 5'h02; //ma
			2: rda_val_o = 5'h03; //acc
			3: rda_val_o = 5'h0a; //cspr
			4: rda_val_o = instruct;
			5: rda_val_o = 5'h09; //cnt
			default:
				rda_val_o = 5'h00;
		endcase
	end
endmodule