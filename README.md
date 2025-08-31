# VGA Controller on FPGA (RGB332)

This project implements a VGA controller on an FPGA using the RGB332 color format.  
It displays images on a VGA monitor by converting digital color signals to analog via DACs.  
Includes Verilog, Python tools, and DAC hardware design.

---

## 🔧 Project Components

1. **Verilog modules** for generating VGA timing and color signals.
2. **Python scripts** to convert bitmap images to RGB332 `.mif` files (used for ROM initialization).
3. **Simple hardware DAC circuits** using resistor ladders (weighted) to generate analog VGA signals.
4. **Simulation helpers** and image processing tools (located in `/sim/`).

---

## 🖼️ RGB332 Color Format
An 8-bit color format:
- 3 bits Red
- 3 bits Green
- 2 bits Blue  
Packed as: `RRR GGG BB`

---

## 📁 Repo Structure

/src/ # Verilog source files  
/sim/ # Simulations and helper scripts  
/sim/bitmap/ # Python scripts for image-to-MIF conversion  
/images_helper/ # Diagrams and visuals  


---

## 📝 Usage

1. Convert your image to `.mif` using scripts in `/sim/bitmap/PixelsFilesGenerator.py`.
2. Load the `.mif` into your FPGA’s ROM module.
3. Build the DAC circuit and connect to VGA.
4. Program the FPGA — it displays your image on the screen!

---

## 📷 Diagrams

🔲 VGA Controller Block Diagram

This diagram shows the overall structure of the VGA controller — including pixel clock generation, counters, sync signal generation, and memory interface.

![Block Diagram](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/GraphicsModeBlockDiagram.png)  
*credit: [narendiran1996.github.io](https://narendiran1996.github.io/project-blogs/jekyll/update/2020/08/14/vgaController.html)*

🔌 DAC Circuit

This is the digital-to-analog converter circuit using resistor ladders.
Each color channel (R, G, B) uses a different resistor weight to approximate VGA voltage levels.
![DAC Circuit](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/DACCircuit.png)  
*credit: [electronics.stackexchange](https://electronics.stackexchange.com/questions/465842/8-bit-vga-dac-design-question)*

---

Feel free to contribute or open issues!
