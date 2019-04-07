Shitty Single Cycle CPU

1) .DNKMMS assembly programs can be opened with a text editor

2) Instruction ROM is a giant switch case. To choose the program just comment out the program you don't want
then compile the code to run in modelsim

3)Values for program are initialized in RAM. You can edit inputs to program by modifying the initial begin
statements in ram.sv. Then compile and run modelsim


R-Type ​:

​ 4 bit opcode | Reg1: 2 bits | Reg2: 3 bits ::

​ Example: CMP $r0, $r1 


A-Type ​:

​ 4 bit opcode | Reg1: 5 bits ::

​ Example: ADD $r0 


I-Type ​: 4 bit opcode | Imm 5 bits ::

​ Example: SMA 31 
 
![alt text](https://raw.githubusercontent.com/nganjehloo/Custom-Single-Cycle-CPU/master/usage.png)
