# VGA Controller on FPGA (RGB332)

This project implements a VGA controller on an FPGA using the RGB332 color format.  
It displays images on a VGA monitor by converting digital color signals to analog via DACs.  
Includes Verilog, Python tools, and DAC hardware design.

**Image: Final output on VGA monitor using the FPGA + DAC setup.**

![WorkingProject](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/WorkingProject_2.jpeg)  


---

## 🔧 Project Components

1. **Verilog modules** for generating VGA timing and color signals.
2. **Python scripts** to convert bitmap images to RGB332 `.mif` files (used for ROM initialization).
3. **Simple hardware DAC circuits** using resistor ladders (weighted) to generate analog VGA signals.

---

## 📊 Workflow Overview

**1. 🖼️ Image Processing with Python**  
A Python script takes a user-provided image (in RGB888 format — 8 bits per channel), and converts it to RGB332 (3 bits red, 3 green, 2 blue), using a custom algorithm that minimizes color loss.

**2. 🗃️ Memory Initialization File Generation**  
The processed pixel data is written to a .mif (Memory Initialization File) containing all the pixel values (~50–500 KB depending on image and resolution).

**3. ⚙️ FPGA Synthesis & ROM Initialization**   
The .mif file is used to initialize a ROM block inside the FPGA during synthesis — embedding the image directly into the design.

**4. 📺 VGA Signal Generation with Verilog Modules**  
Verilog modules generate VGA timing signals (Pixel Clock, HSYNC, VSYNC) and stream the pixel data to the output.
A resistor-ladder DAC converts digital RGB signals to analog voltages for the VGA display.


---

## 🖼️ RGB332 Color Format
An 8-bit format packed as RRR GGG BB — 3 bits Red, 3 bits Green, 2 bits Blue.

---

## 📁 Repo Structure

/src/ # Verilog source files  
/sim/ # Simulations and helper scripts  
/sim/bitmap/ # Python scripts for image-to-MIF conversion   
/sim/bitmap/PixelsFilesGenerator.py # Convert image to mif   
/images_helper/ # Diagrams and visuals  

---

## 📷 Diagrams

🔲 VGA Controller Block Diagram

This diagram shows the overall structure of the VGA controller — including pixel clock generation, counters, sync signal generation, and memory interface.

![BlockDiagarm](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/GraphicsModeBlockDiagram.png)  
*credit: [narendiran1996.github.io](https://narendiran1996.github.io/project-blogs/jekyll/update/2020/08/14/vgaController.html)*


---

🔌 DAC Circuit

This is the digital-to-analog converter circuit using resistor ladders.
Each color channel (R, G, B) uses a different resistor weight to approximate VGA voltage levels.

![DAC Circuit](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/DACCircuit.png)  
*credit: [electronics.stackexchange](https://electronics.stackexchange.com/questions/465842/8-bit-vga-dac-design-question)*

---

Feel free to contribute or open issues!
