module mux1(input logic [1:0] select, input logic [4:0] instruct, output logic [4:0] rs_val_o);

	always_comb begin
		case(select)
			0: rs_val_o = 5'h03;
			1: rs_val_o = instruct;
			2: rs_val_o = {3'b000, instruct[4:3]};
			3: rs_val_o = 5'h04;
		endcase
	end
endmodule