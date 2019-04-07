module mux2(input select, input logic [4:0] instruct, output logic [4:0] rt_val_o);

	always_comb begin
		case(select)
			0: rt_val_o = instruct;
			1: rt_val_o = {2'b00, instruct[2:0]};
		endcase
	end
endmodule