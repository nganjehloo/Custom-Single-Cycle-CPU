module programcounterupdate(
  input branch,
  input [4:0] Target,
  input init,
  input halt,
  input CLK,
  input [7:0] cpsr,
  output logic[7:0] PC
  );

reg [31:0] counter;
initial begin
	counter = 0;
end
	 
  always @(posedge CLK) begin
	if(init)
	  PC <= 0;
	else if(halt)
	  PC <= PC;
	else if(branch == 1)
		if(cpsr[0])
			PC <= PC - Target;
		else
			PC <= PC + Target;
	else if(branch == 0)
	  PC <= PC+1;
	counter <= counter + 1;
  end
endmodule