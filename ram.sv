module ram (
	input CLK,
	input [7:0] write_i,
	input [7:0] addr_i,
	input ren_i,
	input wen_i,
	output [7:0] out_o
);
integer i;
logic [7:0] RAM [255:0];
initial begin
	RAM[1] = 53;
	RAM[2] = 17;
	RAM[3] = 42;
	RAM[6] = 8'b00000011;
	for( i = 32; i < 42; i = i + 1)
		RAM[i] = 8'b00011001;
	for( i = 42; i < 62; i = i + 1)
		RAM[i] = 8'b10111101;
	for( i = 62; i < 71; i = i + 1)
		RAM[i] = 8'b11100111;
	for( i = 71; i < 96; i = i + 1)
		RAM[i] = 0;

	RAM[128] = 1;
	RAM[129] = 3;
	RAM[130] = 5;
	RAM[131] = 7;
	RAM[132] = 9;
	RAM[133] = 11;
	RAM[134] = 13;
	RAM[135] = 15;
	RAM[136] = 17;
	RAM[137] = 19;
	RAM[138] = 21;
	RAM[139] = 23;
	RAM[140] = 25;
	RAM[141] = 30;
	RAM[142] = 0;
	RAM[143] = 40;
	RAM[144] = 50;
	RAM[145] = 60;
	RAM[146] = 80;
	RAM[147] = 255;
end
	
assign out_o = RAM [addr_i];

always@ (posedge CLK) begin
	if (wen_i) begin
		RAM [addr_i] <= write_i;
	end
end

endmodule
