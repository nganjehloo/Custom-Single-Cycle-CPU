//This is the ALU module of the core, op_code_e is defined in definitions.v file
import definitions::*;

module alu (input wire [7:0] rs_i 
           ,input wire [7:0] rt_i
			  ,input  wire overflow_i
			  ,input wire [7:0] cpsr_i
			  ,input  wire [7:0] cnt_i
           ,input wire [3:0] op_i
           ,output reg [8:0] result_o
			  ,output reg branch_o
           ,output reg overflow_o);


typedef enum logic[3:0] {
        SMA, 
        LW, 
        SW,
        ADD,
        STBR, 
        SLL, 
        SLR,
        MOVA,
        MOVR, 
        CMP, 
        BR,
        BREVEN,
        HALT, 
        TBD, 
        PARCMP,
        MNABS
    } op_mne;			              // declare type
op_mne op_mnemonic;	              // declare variable of that type 

always_comb
  begin
	result_o = 0;
	branch_o = 0;
	overflow_o = 0;
	case (op_i)
		kADD:		begin 
					result_o	= rs_i + rt_i + overflow_i;
					overflow_o = result_o[8];
					result_o = {1'b0, result_o[7:0]};
					branch_o = 0;
					end
		kSMA:		result_o = rs_i;
		kMOVA:	begin result_o = rs_i; end
		kMOVR:	result_o = rs_i;
		kLW:		result_o = 9'h000;
		kSW:		result_o = rs_i;
		kSTBR:	result_o = {1'b0,cpsr_i[7:4], (rs_i > 10) ? 4'h0: rs_i[3:0]};
		kCMP:		begin 
					if(rs_i == rt_i)
						result_o = 4'h1;
					else if(rs_i > rt_i)
						result_o = 4'h3;
					else if(rs_i < rt_i)
						result_o = 4'h5;
					else
						result_o = 1'h1;
					result_o = {1'b0, result_o[3:0], cpsr_i[3:0]};
					branch_o = 0;
					overflow_o = 0;
					end
		kSLL: 	begin 
					result_o = {rt_i[6:0], overflow_i}; 
					overflow_o = rs_i[7];
					end
		kSLR:		result_o = {1'b0, rt_i[7:1]};
		kMNABS:	begin result_o =  ($signed(rs_i) > $signed(rt_i)) ? 
									($signed(rs_i) - $signed(rt_i)) : ($signed(rt_i) - $signed(rs_i));
					end
		kPARCMP:	begin
					if( (rs_i[3:0] ^ rt_i[7:4]) == 4'h0 ||
						(rs_i[3:0] ^ rt_i[6:3]) == 4'h0 ||
						(rs_i[3:0] ^ rt_i[5:2]) == 4'h0 ||
						(rs_i[3:0] ^ rt_i[4:1]) == 4'h0 ||
						(rs_i[3:0] ^ rt_i[3:0]) == 4'h0
					)begin
						result_o = cnt_i + 1;
					end else begin
						result_o = cnt_i;
					end
					end
		kHALT: 	result_o = 9'h000;
		kTBD: 	result_o = 9'h000;
		kBR: 		begin
					case(cpsr_i)
					8'h10:	branch_o = 1;
					8'h11:	branch_o = 1;
					8'h32:	branch_o = 1;
					8'h33:	branch_o = 1;
					8'h54:	branch_o = 1;
					8'h55:	branch_o = 1;
					8'h16:	branch_o = 1;
					8'h17:	branch_o = 1;
					8'h36:	branch_o = 1;
					8'h37:	branch_o = 1;
					8'h18:	branch_o = 1;
					8'h19:	branch_o = 1;
					8'h58:	branch_o = 1;
					8'h59:	branch_o = 1;
					default: branch_o = 0;
					endcase
					result_o = 0;
					end
					
		kBREVEN: branch_o = ~rs_i[0];
											
			
      
      default: 
        begin 
          result_o   = 32'd0;
			 branch_o = 1'b0;
			 overflow_o = 1'b0;
        end
    endcase
  end

endmodule 
