module instROM(
    input [7:0] InstAddress,
    output logic[8:0] InstOut);
	 
 // Instructions have [4bit opcode][3bit rs or rt][3bit rt, immediate, or branch target]
	 
	 always_comb
		begin
			case (InstAddress)
				
				//MULTIPLY
				0: 	InstOut = 9'b000000001;   // SMA
				1:	InstOut  = 9'b000100000;   // LW
				2:	InstOut	= 9'b000000010;	// SMA
				3:	InstOut	= 9'b000100100;	// LW
				4:	InstOut	= 9'b000000000;	// SMA
				5:	InstOut	= 9'b011100010;	// MOVA
				6:	InstOut	= 9'b100000001;	// MOVR
				7:	InstOut	= 9'b100001100;	// MOVR
				8:	InstOut	= 9'b100001101;	// MOVR
				9:	InstOut	= 9'b100100100;	// CMP
				10:	InstOut	= 9'b010000010;	// STBR
				11:	InstOut	= 9'b101000101;	// BR
				12:	InstOut	= 9'b000000001;	// SMA
				13:	InstOut	= 9'b000100100;	// LW	
				14:	InstOut	= 9'b000000010;	// SMA
				15:	InstOut	= 9'b000100100;	// LW
				16:	InstOut	= 9'b010000010;	// STBR
				17:	InstOut	= 9'b101100111;	// BREVEN
				18:	InstOut	= 9'b011101100;	// MOVA
				19:	InstOut	= 9'b001100000;	// ADD
				20:	InstOut	= 9'b100001100;	// MOVR
				21:	InstOut	= 9'b011101101;	// MOVA
				22:	InstOut	= 9'b001100001;	// ADD
				23:	InstOut	= 9'b100001101;	// MOVR
				24:	InstOut  = 9'b011100000;	// MOVA
				25:	InstOut	= 9'b010100011;	// SLL
				26:	InstOut	= 9'b100000000;	// MOVR
				27:	InstOut	= 9'b011100001;	// MOVA
				28:	InstOut	= 9'b010100011;	// SLL
				29:	InstOut	= 9'b100000001;	// MOVR
				30:	InstOut	= 9'b011000100;	// SLR
				31:	InstOut	= 9'b100000100;	// MOVR
				32:	InstOut	= 9'b100111110;	// CMP
				33:	InstOut	= 9'b010000011;	// STBR
				34:	InstOut	= 9'b101010010; // BR
				35:	InstOut = 9'b000000011;	// SMA
				36:	InstOut = 9'b000100100;	// LW
				37:	InstOut = 9'b000000100;	// SMA
				38:	InstOut = 9'b001001100;	// SW
				39:	InstOut = 9'b000000101;	// SMA
				40:	InstOut = 9'b001001101;	// SW
				41:	InstOut = 9'b011101100;	// MOVA
				42:	InstOut	= 9'b100000000;	// MOVR
				43:	InstOut = 9'b011101101;	// MOVA
				44:	InstOut = 9'b100000001;	// MOVR
				45:	InstOut = 9'b000000000; //SMA
				46:	InstOut = 9'b011100010; //MOVA
				47:	InstOut = 9'b100001100;	//MOVR
				48:	InstOut = 9'b100001101;	//MOVR
				49:	InstOut	= 9'b010000010;	// STBR	
				50:	InstOut	= 9'b101101000;	// BREVEN
				51:	InstOut = 9'b011101100;	// MOVA
				52:	InstOut	= 9'b001100000;	// ADD
				53:	InstOut = 9'b100001100;	// MOVR
				54:	InstOut = 9'b011101101;	// MOVA
				55:	InstOut = 9'b001100001;	// ADD
				56:	InstOut = 9'b100001101;	// MOVR
				57:	InstOut = 9'b001100110;	// ADD
				58:	InstOut = 9'b011100000;	// MOVA
				59:	InstOut = 9'b010100011;	// SLL
				60:	InstOut = 9'b100000000;	// MOVR
				61:	InstOut = 9'b011100001;	// MOVA
				62:	InstOut = 9'b010100011;	// SLL
				63:	InstOut = 9'b100000001;	// MOVR
				64:	InstOut = 9'b001100110;	// ADD
				65:	InstOut = 9'b011100001; // MOVA
				66:	InstOut = 9'b011000100;	// SLR
				67:	InstOut = 9'b100000100;	// MOVR
				68:	InstOut	= 9'b100111110;	// CMP
				69:	InstOut = 9'b010000011;	// STBR
				70:	InstOut = 9'b101010101;	// BR
				71:	InstOut = 9'b000000100;	// SMA
				72:	InstOut = 9'b001001100;	// SW
				73:	InstOut = 9'b000000101;	// SMA
				74:	InstOut = 9'b001001101;	// SW
				75:	InstOut = 9'b110000000;	// HALT
				
			
				/*//String Match
				0:	InstOut = 9'b000000110;	// SMA
				1:	InstOut = 9'b000100000;	// LW
				2:	InstOut = 9'b000011111;	// SMA
				3:	InstOut = 9'b011100010;	// MOVA
				4:	InstOut = 9'b001100111;	// ADD
				5:	InstOut = 9'b001100011;	// ADD
				6:	InstOut = 9'b001100010;	// ADD
				7:	InstOut = 9'b100001100;	// MOVR
				8:	InstOut = 9'b000011111;	// SMA
				9:	InstOut = 9'b010000101;	// STBR
				10:	InstOut = 9'b011100010;	// MOVA
				11:	InstOut = 9'b001100111;	// ADD
				12:	InstOut = 9'b100000010;	// MOVR
				13:	InstOut = 9'b000100001;	// LW
				14:	InstOut = 9'b111000001;	// PARCMP
				15:	InstOut = 9'b011101100;	// MOVA
				16:	InstOut = 9'b100110011;	// CMP
				17:	InstOut = 9'b101000111;	// BR
				18:	InstOut = 9'b000000111; //SMA
				19:	InstOut = 9'b001001001;	//SW
				20:	InstOut = 9'b110000000;	// HALT*/
				
/*
				//MIN DISTANCE
0:	InstOut = 9'b000011111;	// SMA
1:	InstOut = 9'b011100010;  // MOVA
2:	InstOut = 9'b010100011;	// SLL
3:	InstOut = 9'b010100011;	// SLL
4:	InstOut = 9'b010100011;	// SLL
5:	InstOut = 9'b100000010;	// MOVR
6:	InstOut = 9'b000000111;	// SMA
7:	InstOut = 9'b001100010;	// ADD
8:	InstOut = 9'b100001100;	// MOVR
9: InstOut = 9'b011000011;	// SLR
10:InstOut = 9'b100000010;	// MOVR
11:InstOut = 9'b100001011;	// MOVR
12:InstOut = 9'b001001100;	// SW
13:InstOut = 9'b001100111;	// ADD
14:InstOut = 9'b100000100;	// MOVR
15:InstOut = 9'b001100111;	// ADD
16:InstOut = 9'b100000101;	// MOVR
17:InstOut = 9'b000001111;	// SMA
18:InstOut = 9'b001100010;	// ADD
19:InstOut = 9'b000000100;	// SMA
20:InstOut = 9'b001100010; // ADD
21:InstOut = 9'b100001101;	// MOVR
22:InstOut = 9'b010000011;	// STBR
23:InstOut = 9'b011100100;	// MOVA
24:InstOut = 9'b100000010;	// MOVR
25:InstOut = 9'b000100000;	// LW
26:InstOut = 9'b001100111;	// ADD
27:InstOut = 9'b100000101;	// MOVR
28:InstOut = 9'b100000010;	// MOVR
29:InstOut = 9'b000100001;	// LW
30:InstOut = 9'b111101000;	// MNABS
31:InstOut = 9'b001100111;	// ADD
32:InstOut = 9'b100000101;	// MOVR
33:InstOut = 9'b011101000;	// MOVA
34:InstOut = 9'b100000010;	// MOVR
35:InstOut = 9'b011101100;	// MOVA
36:InstOut = 9'b100110011;	// CMP
37:InstOut = 9'b010000110;	// STBR
38:InstOut = 9'b101000011;	// BR
39:InstOut = 9'b011100010;	// MOVA
40:InstOut = 9'b100001100;	// MOVR
41:InstOut = 9'b011101101;	// MOVA
42:InstOut = 9'b100111101;	// CMP
43:InstOut = 9'b010000011; // STBR
44:InstOut = 9'b011100101;	// MOVA
45:InstOut = 9'b101010001; // BR
46:InstOut = 9'b011100100;	// MOVA
47:InstOut = 9'b001100111;	// ADD
48:InstOut = 9'b100000100;	// MOVR
49:InstOut = 9'b011101101;	// MOVA
50:InstOut = 9'b010000011;	// STBR
51:InstOut = 9'b100111100;	// CMP
52:InstOut = 9'b101011101;	// BR
53:InstOut = 9'b011101011;	// MOVA
54:InstOut = 9'b100000010;	// MOVR
55:InstOut = 9'b001001100;	// SW
56:InstOut = 9'b110000000;*/
				default: InstOut = 0;
			endcase
		end

endmodule