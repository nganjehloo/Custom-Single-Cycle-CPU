module toplevel(input CLK, start);

	logic branch;
	logic [4:0] Target;
	wire [8:0] InstOut;
	// Outputs
	logic [7:0] PC;
	logic branch_o;
	logic branch_cntrl;
	logic [7:0] mem_o;
	logic [8:0] result_o;
	logic [7:0] cpsr_o;
	
	assign branch = branch_o & branch_cntrl;
	// Instantiate the Unit Under Test (UUT)
	programcounterupdate uut (
  	  .branch(branch), 
	  .Target(InstOut[4:0]), 
	  .init(start)  ,
	  .halt(halt)  ,
	  .CLK(CLK)   ,
	  .cpsr(cpsr_o), 
	  .PC(PC)    
	);
	
	instROM uut1(
   PC,
   InstOut
	);
	
	wire [2:0] rs_cntrl;
	wire [2:0] rt_cntrl;
	wire we_i;
	wire memwe_i;
	wire mem_cntrl;
	wire oe_i;
	wire alu_stc_cntrl;
	wire [2:0] rd_cntrl;
	wire [2:0] rda_cntrl;
	
	controller cont (.OPCODE(InstOut[8:5]),
    .REG_S_READ(rs_cntrl),
	 .REG_T_READ(rt_cntrl),
    .REG_WRITE(we_i),
	 .REG_W_SRC(rd_cntrl),
    .BRANCH(branch_cntrl),
    .MEM_WRITE(memwe_i),
    .MEM_READ(mem_cntrl),
    .REG_DST(rda_cntrl),
	 .HALT(halt),
	 .OVERFLOW(oe_i),
	 .ALU_SRC(alu_src_cntrl)
    );

		wire [4:0] rs_val_i;
		wire [4:0] rt_val_i;
		wire [7:0] rd_val_i;
		wire [4:0] rd_addr_i;
		logic  overflow_i;

		// Outputs
		logic [7:0] rs_val_o;
		logic [7:0] rt_val_o;
		wire overflow_o;
		
		mux1 muxrs (.select(rs_cntrl), .instruct(InstOut[4:0]), .rs_val_o(rs_val_i));
		/*assign rs_val_i = (rs_cntrl == 0) ? 5'h03 :
								(rs_cntrl == 1) ? InstOut[4:0]:
								(rs_cntrl == 2) ? {3'b000, InstOut[4:3]}:
								(rs_cntrl == 3) ? 5'h00 : 
								(rs_cntrl == 4) ? 5'h04 : 5'h0a;*/
								
		mux2 muxrt (.select(rt_cntrl), .instruct(InstOut[4:0]), .rt_val_o(rt_val_i));
		/*assign rt_val_i = (rt_cntrl == 0) ? InstOut[4:0] : {2'b00, InstOut[2:0]};*/
						
		mux3 muxrda (.select(rda_cntrl), .instruct(InstOut[4:0]), .rda_val_o(rd_addr_i));		
		/*assign rd_addr_i = (rda_cntrl == 0) ? 5'h08 : //r6
								(rda_cntrl == 1) ? 5'h02 : //ma
								(rda_cntrl == 2) ? 5'h03 : //acc
								(rda_cntrl == 3) ? 5'h0a : //cpsr
								(rda_cntrl == 4) ? InstOut[4:0] : 5'h09; //cnt*/
								
		mux4 muxrd (.mem_i(mem_o), .instruct(InstOut[4:0]), .result_i(result_o), .select(rd_cntrl), .rd_val_o(rd_val_i));
		/*						
		assign rd_val_i = (rd_cntrl == 0) ? mem_o :
								(rd_cntrl == 1) ? {3'b000, InstOut[4:0]} :
								(rd_cntrl == 2) ? result_o : 8'h03;*/
		logic [7:0] ma_o;
		logic [7:0] cnt_o;
		
		// Instantiate the Unit Under Test (UUT)
		registerfile uut_rf (
			.rs_addr_i(rs_val_i),
			.rt_addr_i(rt_val_i),
			.rd_addr_i(rd_addr_i),
			.wen_i(we_i),
			.oen_i(oe_i),
			.overflow_i(overflow_i),
			.write_data_i(rd_val_i),
			.rs_val_o(rs_val_o),
			.rt_val_o(rt_val_o),
			.cnt_o(cnt_o),
			.cpsr_o(cpsr_o),
			.overflow_o(overflow_o),
			.CLK(CLK),
			.ma_o(ma_o)
		);
		
	logic [7:0] rs_alu_i;

	assign rs_alu_i = (alu_src_cntrl == 0) ? rs_val_o : {3'b000,InstOut[4:0]};

	alu uuta (
		.rs_i(rs_alu_i), 
		.rt_i(rt_val_o),
		.overflow_i(overflow_o),
		.cpsr_i(cpsr_o),
		.cnt_i(cnt_o),
		.op_i(InstOut[8:5]), 
		.result_o(result_o), 
		.branch_o(branch_o),
		.overflow_o(overflow_i)
	);
	
	
	 ram  ramu (
	.CLK(CLK),
	.write_i(result_o),
	.addr_i(ma_o),
	.ren_i(mem_cntrl),
	.wen_i(memwe_i),
	.out_o(mem_o)
);

endmodule