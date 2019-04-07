module toplevel_tb; 
	reg clk, start; 
  
  toplevel U0 ( 
	.CLK    (clk), 
	.start	(start)
	); 
  
	initial 
	begin 
		clk = 0; 
		start = 0;
		#100;
		start = 1;
		#10;
		start = 0;
	end 
    
	always 
		#100  clk =  ! clk; 
     
endmodule 