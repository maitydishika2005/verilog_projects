# Verilog Projects

## Overview
This repository contains three Verilog-based projects implemented using Xilinx Vivado and tested on the Basys-3 FPGA board. These projects focus on fundamental digital design concepts such as data selection, rotation-based data transfer, and bus-based register operations. Each design has been implemented using behavioral modeling and optimized for efficient hardware implementation.

## Projects

### 1. Simple Data Selector
#### Description
The data selector allows input data to be transferred to the output under specific conditions:
- If either the Most Significant Bit (MSB) or the Least Significant Bit (LSB) is `1`, the input is passed to the output.
- Otherwise, the output retains its previous state.

#### Enhancements:
- Introduced a **Start button** to prevent unnecessary multiple iterations.
- A **Ready signal** was added to indicate the completion of one iteration for a single input.

---

### 2. Simple Data Transfer and Rotation System
#### Description
This system takes a 4-bit input vector `X` and two control signals `a` and `b` to determine how the data is transferred:
- **`a = 0, b = 0`** → `X` is not transferred.
- **`a = 0, b = 1`** → `X` is transferred as it is.
- **`a = 1, b = 0`** → `X` is right-rotated by one position.
- **`a = 1, b = 1`** → `X` is right-rotated by two positions.

#### Implementation Approach:
- Initially modeled using **behavioral Verilog**.
- Later optimized for FPGA implementation.

---

### 3. Bus-Based Data Transfer System
#### Description
A simple **4-bit bus-based system** was designed, featuring two registers (`A` and `B`), an input control unit (4 toggle switches), and an output display unit (4 LEDs). The system performs the following sequence:
1. Load register **A** with `2H`.
2. Display the contents of register A.
3. Load register **B** with `0H`.
4. Display the contents of register B.
5. Transfer the data from register A to register B.
6. Display the contents of register B.

#### Implementation Approach:
- Initially implemented using **behavioral modeling**.
- Later optimized for better hardware efficiency.

---

## Technology Used
- **HDL**: Verilog
- **Design Software**: Xilinx Vivado
- **FPGA Board**: Basys-3

---

## How to Run the Projects
1. Clone this repository:
   ```sh
   git clone https://github.com/maitydishika2005/verilog-projects.git
   ```
2. Open Xilinx Vivado and import the project files.
3. Synthesize and implement the design.
4. Load the bitstream onto the Basys-3 FPGA board.
5. Use the onboard switches and buttons to test the functionality.

## Author
**Dishika Maity**  
Electronics and Telecommunication Engineering, Jadavpur University  
Interested in Digital Design and VLSI

