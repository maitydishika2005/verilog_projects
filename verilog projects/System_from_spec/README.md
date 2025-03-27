# Simple Data Transfer and Rotation System

## Overview
This project implements a **4-bit data transfer and rotation system** based on two control signals `a` and `b`. The system is designed in Verilog, synthesized using Xilinx Vivado, and tested on the Basys-3 FPGA board.

## Functionality
The system takes a 4-bit input vector `X` and determines how it should be transferred:
- **`a = 0, b = 0`** → `X` is not transferred.
- **`a = 0, b = 1`** → `X` is transferred as it is.
- **`a = 1, b = 0`** → `X` is right-rotated by one position.
- **`a = 1, b = 1`** → `X` is right-rotated by two positions.

## Implementation Details
- **HDL Used:** Verilog
- **Design Software:** Xilinx Vivado
- **FPGA Board:** Basys-3

## How to Use
1. Open Xilinx Vivado and import the Verilog source files.
2. Synthesize and implement the design.
3. Load the bitstream onto the Basys-3 FPGA board.
4. Use the onboard switches to set the values of `a`, `b`, and `X`.
5. Observe the output transformation based on the selected operation.

## Author
**Dishika Maity**
Electronics and Telecommunication Engineering, Jadavpur University

Feel free to modify and improve the design!

