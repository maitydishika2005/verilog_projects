# Simple Data Selector

## Overview
This project implements a **Simple Data Selector** that transfers input data to the output based on specific conditions. The design is implemented in Verilog, synthesized using Xilinx Vivado, and tested on the Basys-3 FPGA board.

## Functionality
- The system transfers the input directly to the output **only if either the Most Significant Bit (MSB) or the Least Significant Bit (LSB) is `1`**.
- Otherwise, the output retains its previous state.

## Enhancements
- Introduced a **Start button** to prevent unnecessary multiple iterations.
- Added a **Ready signal** to indicate the completion of one iteration for a single input.

## Implementation Details
- **HDL Used:** Verilog
- **Design Software:** Xilinx Vivado
- **FPGA Board:** Basys-3

## How to Use
1. Open Xilinx Vivado and import the Verilog source files.
2. Synthesize and implement the design.
3. Load the bitstream onto the Basys-3 FPGA board.
4. Use the onboard switches to control input values.
5. Observe the output on the LEDs based on the data selection logic.

## Author
**Dishika Maity**
Electronics and Telecommunication Engineering, Jadavpur University



