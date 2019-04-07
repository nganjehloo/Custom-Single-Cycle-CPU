// This file defines the parameters used in the alu
package definitions;
    
    // Instruction map
    const logic [3:0]kSMA    = 4'b0000;
    const logic [3:0]kLW     = 4'b0001;
    const logic [3:0]kSW     = 4'b0010;
    const logic [3:0]kADD    = 4'b0011;
    const logic [3:0]kSTBR   = 4'b0100;
    const logic [3:0]kSLL    = 4'b0101;
    const logic [3:0]kSLR    = 4'b0110;
    const logic [3:0]kMOVA   = 4'b0111;
    const logic [3:0]kMOVR   = 4'b1000;
    const logic [3:0]kCMP    = 4'b1001;
    const logic [3:0]kBR     = 4'b1010;
    const logic [3:0]kBREVEN = 4'b1011;
    const logic [3:0]kHALT   = 4'b1100;
    const logic [3:0]kTBD    = 4'b1101;
    const logic [3:0]kPARCMP = 4'b1110;
    const logic [3:0]kMNABS  = 4'b1111;
    
    typedef enum logic[3:0] {
        SMA     = 4'h0, 
        LW      = 4'h1, 
        SW      = 4'h2,
        ADD     = 4'h3,
        STBR    = 4'h4, 
        SLL     = 4'h5, 
        SLR     = 4'h6,
        MOVA    = 4'h7,
        MOVR    = 4'h8, 
        CMP     = 4'h9, 
        BR      = 4'hA,
        BREVEN  = 4'hB,
        HALT    = 4'hC, 
        TBD     = 4'hD, 
        PARCMP  = 4'hE,
        MNABS   = 4'hF
    } op_mne;
    
endpackage // defintions
