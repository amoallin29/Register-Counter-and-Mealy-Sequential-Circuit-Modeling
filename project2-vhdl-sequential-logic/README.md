# VHDL Sequential Logic & Mealy FSM Design

This repository contains three VHDL designs from sequential-logic project:

- a 4-bit bidirectional shift register
- a 4-bit synchronous up/down counter
- a Mealy sequence detector for the overlapping input sequence `01101`

## Project Overview

The project focused on modeling and simulating synchronous sequential circuits in VHDL using Xilinx ISE / ISim.

### Shift Register
The 4-bit register supports synchronous active-low clear, hold, shift right, shift left, and parallel load.

### Up/Down Counter
The 4-bit counter supports parallel load, enable/hold, count up, count down, and ripple-carry output (`RCO`) at the terminal count for the active direction.

### Mealy Sequence Detector
The Mealy FSM detects the overlapping sequence `01101`. The design uses five states (`S0` through `S4`) and asserts `Z` when the final `1` of the sequence is detected.

## Repository Structure

```text
project2-vhdl-sequential-logic/
├── README.md
├── src/
│   ├── reg.vhd
│   ├── cnt.vhd
│   └── mealy.vhd
├── testbench/
│   ├── reg_tb.vhd
│   ├── cnt_tb.vhd
│   └── mealy_tb.vhd
├── images/
└── docs/- Project report 
```


## Tools

- VHDL
- Xilinx ISE Project Navigator
- ISim Simulator
