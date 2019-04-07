import definitions::*;

module controller(
    input        [3:0] OPCODE,
    output logic [2:0] REG_S_READ,
	 output logic [2:0] REG_T_READ,
    output logic       REG_WRITE,
	 output logic [2:0] REG_W_SRC,
    output logic       BRANCH,
    output logic       MEM_WRITE,
    output logic       MEM_READ,
    output logic [2:0] REG_DST,
	 output logic       HALT,
	 output logic       OVERFLOW,
	 output logic 		  ALU_SRC
    );
	 
	 	
	always_comb	begin
		
	  case(OPCODE)
	  	0 :	begin
			  REG_S_READ = 3'bxxx;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 1; //SMA
			  REG_W_SRC	 = 1;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 1;
		 end
		 1 : begin
			  REG_S_READ = 3'bxxx;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 4;	//LW
			  REG_W_SRC	 = 0;
			  BRANCH     = 0;
			  MEM_READ   = 1;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT 		 = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		 end
		 2 : begin
			  REG_S_READ = 1;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 3'bxxx; //SW
			  REG_W_SRC	 = 3'bxxx;
			  BRANCH     = 0;
			  MEM_READ   = 0;
			  MEM_WRITE  = 1;
			  REG_WRITE  = 0;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		 4 : begin
			  REG_S_READ = 3'bxxx;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 3; //STBR
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 1;
		  end
		  7 : begin
			  REG_S_READ = 1;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 2; //MOVA
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		  
		  8 : begin
			  REG_S_READ = 0;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 4; //MOVR
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		  9: begin
			  REG_S_READ = 2;
			  REG_T_READ = 1;
			  REG_DST    = 3;  //CMP
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;	
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		   14: begin
			  REG_S_READ = 2;
			  REG_T_READ = 1;
			  REG_DST    = 5;  //PARCMP
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		  10: begin
			  REG_S_READ = 3'bxxx;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 3'bxxx;  //BR
			  REG_W_SRC	 = 3'bxxx;
			  BRANCH     = 1;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 0;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		   11: begin
			  REG_S_READ = 3;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 3'bxxx;  //BREVEN
			  REG_W_SRC	 = 3'bxxx;
			  BRANCH     = 1;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 0;
			  HALT       = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		    12: begin
			  REG_S_READ = 3'bxxx;
			  REG_T_READ = 3'bxxx;
			  REG_DST    = 3'bxxx;			 //HALT
			  REG_W_SRC	 = 3'bxxx;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 0;
			  HALT       = 1;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
			  end
			 15: begin
			  REG_S_READ = 2;
			  REG_T_READ = 1;
			  REG_DST    = 0;			 //MNABS
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT   	 = 0;
			  OVERFLOW	 = 0;
			  ALU_SRC    = 0;
		  end
		  default: begin
			  REG_S_READ = 0;
			  REG_T_READ = 0;
		  	  REG_DST    = 2; //SLL && SLR && ADD
			  REG_W_SRC	 = 2;
			  BRANCH     = 0;
			  MEM_READ   = 3'bxxx;
			  MEM_WRITE  = 0;
			  REG_WRITE  = 1;
			  HALT       = 0;
			  OVERFLOW	 = 1;
			  ALU_SRC    = 0;
		  end
		endcase
	end

endmodule