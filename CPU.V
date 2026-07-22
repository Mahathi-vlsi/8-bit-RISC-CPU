`timescale 1ns/1ps
module cpu(
    input clk,
    input rst
);

reg [7:0] reg_file [0:7];
reg [7:0] pc;
reg [15:0] instr_mem [0:255];
reg [7:0] data_mem [0:255];
reg [15:0] instr;
reg [7:0] alu_out;
reg [2:0] rd, rs1, rs2;
reg [4:0] opcode;
reg [7:0] imm;
reg zero_flag;

always @(posedge clk) begin
    if(rst) begin
        pc <= 0; 
        zero_flag <= 0;
        for(integer i=0; i<8; i=i+1) reg_file[i] <= 0;
    end
    else begin
        instr <= instr_mem[pc];
        opcode <= instr[15:11]; 
        rd <= instr[10:8]; 
        rs1 <= instr[7:5]; 
        rs2 <= instr[4:2]; 
        imm <= instr[7:0];
        
        case(opcode)
            5'b00000: begin alu_out = reg_file[rs1] + reg_file[rs2]; zero_flag = (alu_out==0); end // ADD
            5'b00001: begin alu_out = reg_file[rs1] - reg_file[rs2]; zero_flag = (alu_out==0); end // SUB
            5'b00010: alu_out = reg_file[rs1] & reg_file[rs2]; // AND
            5'b00011: alu_out = reg_file[rs1] | reg_file[rs2]; // OR
            5'b00100: alu_out = imm; // LOAD_IMM
            5'b00101: alu_out = data_mem[imm]; // LOAD
            5'b00110: data_mem[imm] = reg_file[rd]; // STORE
            5'b00111: if(zero_flag) pc = pc + imm - 1; // BEQ
            5'b01000: pc = imm - 1; // JMP
        endcase
        
        if(opcode <= 5'b00101) reg_file[rd] <= alu_out;
        if(opcode!= 5'b00111 && opcode!= 5'b01000) pc <= pc + 1;
    end
end

initial begin
    instr_mem[0] = 16'h090A; // R1 = 10
    instr_mem[1] = 16'h0914; // R2 = 20
    instr_mem[2] = 16'h0032; // ADD R3, R1, R2
    instr_mem[3] = 16'h1632; // STORE R3, 50
end
endmodule