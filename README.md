# 8-bit Single-Cycle RISC CPU

A single-cycle 8-bit RISC Processor designed and implemented in Verilog HDL for VLSI learning.

##  Key Features
- **Architecture**: Single-cycle, Harvard Architecture
- **Data Width**: 8-bit 
- **Address Width**: 8-bit
- **Registers**: 8 x 8-bit General Purpose Registers
- **Instruction Set**: 9 Instructions - ADD, SUB, AND, OR, LOAD_IMM, LOAD, STORE, BEQ, JMP
- **Memory**: Separate 256x8 Instruction and Data Memory
- **Control Unit**: FSM-based Control Unit

## How to Simulate
1. Go to https://edaplayground.com
2. Create New Project → Upload `CPU.V` and `tb_cpu.v`
3. Simulator: Icarus Verilog
4. Expected Output: R3 = 30, Memory[50] = 30

## Features
- 8-bit RISC CPU with 9 instructions
- 8 General Purpose Registers R0-R7
- 256x8 Data Memory, 256x16 Instruction Memory
- Supports ADD, SUB, AND, OR, LOAD, STORE, JMP, BEQ, LOAD_IMM

## Instruction Set
| Opcode | Instruction | Description |
| --- | --- | --- |
| 00000 | ADD | R[rd] = R[rs1] + R[rs2] |
| 00001 | SUB | R[rd] = R[rs1] - R[rs2] |
| 00100 | LOAD_IMM | R[rd] = imm |
| 00110 | STORE | Mem[imm] = R[rd] |
| 01000 | JMP | PC = imm |

