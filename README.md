# VGA Controller on FPGA (RGB332)

This project implements a VGA controller on an FPGA using the RGB332 color format.  
It displays images on a VGA monitor by converting digital color signals to analog via DACs.  
Includes Verilog, Python tools, and DAC hardware design.

Image: Final output on VGA monitor using the FPGA + DAC setup.
![Block Diagram](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/GraphicsModeBlockDiagram.png)  


---

## 🔧 Project Components

1. **Verilog modules** for generating VGA timing and color signals.
2. **Python scripts** to convert bitmap images to RGB332 `.mif` files (used for ROM initialization).
3. **Simple hardware DAC circuits** using resistor ladders (weighted) to generate analog VGA signals.
4. **Simulation helpers** and image processing tools (located in `/sim/`).

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
![WorkingSystem](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/WorkingProject.jpeg)  

---

🔌 DAC Circuit

This is the digital-to-analog converter circuit using resistor ladders.
Each color channel (R, G, B) uses a different resistor weight to approximate VGA voltage levels.
![DAC Circuit](https://github.com/OmerMaruani/VGAControllerFPGA/blob/main/images_helper/DACCircuit.png)  
*credit: [electronics.stackexchange](https://electronics.stackexchange.com/questions/465842/8-bit-vga-dac-design-question)*

---

Feel free to contribute or open issues!
