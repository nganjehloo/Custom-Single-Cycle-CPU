module mux4(input wire [7:0] mem_i, input wire [4:0] instruct, input wire [7:0] result_i, input wire [2:0] select, output logic [7:0] rd_val_o);
	
	always_comb begin
		case(select)
			0: rd_val_o = mem_i;
			1: rd_val_o = {3'b000, instruct};
			2: rd_val_o = result_i;
			3: rd_val_o = 8'h03;
			default:
			rd_val_o = 8'h00;
		endcase
	end
	
endmodule