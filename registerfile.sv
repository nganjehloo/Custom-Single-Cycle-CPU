// A register file with asynchronous read and synchronous write
module registerfile #(parameter addr_width_p = 4)
                (input CLK
                ,input [addr_width_p-1:0] rs_addr_i
					 ,input [addr_width_p-1:0] rt_addr_i
                ,input [addr_width_p-1:0] rd_addr_i
                ,input wen_i
					 ,input oen_i
					 ,input overflow_i
                ,input [7:0] write_data_i
                ,output logic [7:0] rs_val_o
                ,output logic [7:0] rt_val_o
					 ,output logic [7:0] cnt_o
					 ,output logic [7:0] cpsr_o
					 ,output bit overflow_o
					 ,output logic [7:0] ma_o
                );

integer i;
logic [7:0] RF [2**addr_width_p-1:0];
logic overflow;

initial begin
	for(i = 0; i < 16; i++) begin
		RF[i] = 0;
	end
end


assign rs_val_o = RF [rs_addr_i];
assign rt_val_o = RF [rt_addr_i];
assign overflow_o = overflow;
assign cnt_o = RF[9];
assign cpsr_o = RF[10];
assign ma_o = RF[2];
always @ (posedge CLK)
  begin
    if (wen_i && rd_addr_i != 7 && rd_addr_i != 6) begin
	/*cnt_o = RF[9];
	cpsr_o = RF[12];
	ma_o = RF[2];*/
	if(oen_i)
		overflow <= overflow_i;
	begin
    		RF [rd_addr_i] <= write_data_i;
		RF[6] <= 0;
		RF[7] <= 8'b00000001;
	end
    end
  end

endmodule
