# VGA Controller Project

This project implements a **VGA controller** on an FPGA that outputs video signals using the **RGB332** color format.
The FPGA sends digital values representing colors to three Digital-to-Analog Converters (DACs),
which convert the digital signals into analog voltages for the VGA display inputs.

## Project Overview

- The **FPGA** generates digital color signals encoded in **RGB332 format**:
  - **3 bits for Red**
  - **3 bits for Green**
  - **2 bits for Blue**
- These 8-bit values are sent to **3 DAC units** (one per color channel).
- The DACs convert the digital signals into analog voltages compatible with VGA analog inputs.
- This setup enables the FPGA to output color video on a standard VGA monitor.

## RGB332 Color Format

The RGB332 encoding packs colors into a single 8-bit value:
Bits: 7 6 5 | 4 3 2 | 1 0
RRR GGG BB

This format balances color depth and bandwidth, suitable for efficient VGA color signaling.

## Simulation and Bitmap Conversion

- The `/sim/bitmap` folder contains **Python scripts** that convert input images into **Memory Initialization Files (MIF)**.
- These scripts process images and output pixel data in **RGB332 format** for the FPGA ROM.
- The MIF files initialize the FPGA's ROM, storing bitmap data to be displayed on the VGA screen.

## Repository Structure

/src/ # FPGA Verilog source code
/sim/ # Simulation scripts and helpers
/sim/bitmap/ # Python scripts for image-to-MIF conversion


## Usage

1. Use the Python scripts in `/sim/bitmap` to convert images to MIF files in RGB332 format.
2. Load the MIF files into the FPGA ROM during synthesis.
3. Program the FPGA to output VGA signals based on the ROM bitmap data.


Feel free to contribute or open issues if you need help!