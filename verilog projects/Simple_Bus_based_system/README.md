# Bus-Based Data Transfer System

## Overview
This project implements a **4-bit bus-based system** that allows manual control over data transfer and display. The system is designed in Verilog, synthesized using Xilinx Vivado, and tested on the Basys-3 FPGA board.

## Functionality
The system consists of:
- **Two 4-bit registers:** `A` and `B`
- **Input unit:** 4 toggle switches
- **Output unit:** 4 LEDs

The system performs the following operations:
1. Load register **A** with `2H`.
2. Display the contents of register A.
3. Load register **B** with `0H`.
4. Display the contents of register B.
5. Transfer data from register A to register B.
6. Display the contents of register B.

## Implementation Details
- **HDL Used:** Verilog
- **Design Software:** Xilinx Vivado
- **FPGA Board:** Basys-3

## How to Use
1. Open Xilinx Vivado and import the Verilog source files.
2. Synthesize and implement the design.
3. Load the bitstream onto the Basys-3 FPGA board.
4. Use the onboard switches to control data loading and transfer.
5. Observe the output on the LEDs based on register values.

## Author
**Dishika Maity**
Electronics and Telecommunication Engineering, Jadavpur University

Feel free to modify and improve the design!

