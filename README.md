# sram_sky130
This project focuses Simulation of Noise Resilient SRAM cell design with operating voltage of 1.8v 
and access time of less than 2.5ns using opensource Google-skywater(sky130) pdk technology and compiled using 
opensource compiler openRAM.The circuits(custom cells) which are required as input to openRAM 
are designed and simluated using opensource tools.

# Table of Contents  
- [Opensource Tools used](#Opensource-Tools-used)  
- [Installing and Cloning Instructions](#Installing-and-Cloning-Instructions)  
- [SRAM Memory Architecture](##SRAM-Memory-Architecture)
- [Inputs to OpenRAM compiler](##Inputs-to-OpenRAM-compiler)
- [Analysis of 6T-SRAM cell](##Analysis-of-6T-SRAM-cell)
- [Future Work](#future-work) 
- [Author](#Author)
- [Acknowledgements](#Acknowledgements)  
- [Contact Information](#Contact-information) 

# Opensource Tools used:

1. Ngspice : Ngspice is an opensource spice simulator for electric and electronic circuits.For more info regarding ngspice installation and tutorial follow http://ngspice.sourceforge.net/ngspice-tutorial.html .

2. xschem : An opensource source tool for drawing schematics.It allows hierarchical representation of circuits.For installation and configurin with sky130 follow :
https://github.com/bluecmd/learn-sky130/blob/main/schematic/xschem/getting-started.md#installation-of-sky130-primitives-and-symbols .

# Installing and Cloning Instructions

Please follow below instructions :(For Ubuntu users)
<dl>
    <dd> 1. Open terminal </dd>
    <dd> 2. Type below command to install git and clone repository: </dd>
</dl>

```
$  sudo apt install git
$  git clone https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs.git
$  cd sram_sky130
$  chmod +777 install_and_clone.sh
$  ./install_and_clone.sh

```
Note: Running script install_and_clone.sh will install ngspice tool and clone to required Google-skywater(sky130) PDK.

<dl>
  <dd> 3. Simulation of Basic CMOS inverter: Basic check for installation </dd>
</dl>

```
$    cd sram_sky130/Ngspice_Netlist
$    ngspice sram.spice 
```


## 6T SRAM DESIGN

![](https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs/blob/main/The-schematic-diagram-of-conventional-6T-SRAM-Cell.png)

## Inputs to OpenRAM compiler


Custom cells required:
* SRAM bit cell
* SRAM test Schematic

# Prelayout Schematic and Simulation waveforms
The Schematics are drawn using opensource xschem tool and simulation is performed using Ngspice,both are configured with sky130 library.


## 1. 6T_SRAM cell 
The standard 1-bit 6T - SRAM cell consists of 6 transistors. It has pair of cross-coupled CMOS inverters and two NMOS access transistors(M5, M6). 
The NMOS transistors (M2, M4) and PMOS transistors(M1,M3) are driver and pull up transistors respectively.

**Circuit Diagram :**

![](https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs/blob/main/Screenshot%20from%202024-11-08%2023-43-31.png)

**SRAM test schematic :**
<dl>
  <dd>The write operation test schematic for a 6T SRAM cell is essential in evaluating the cell’s ability to perform accurate and reliable data storage. The write operation is a fundamental SRAM process, wherein the stored data value within the memory cell is altered by selectively applying voltages to the bit lines (BL and BLB) and activating the word line (WL). In the 6T SRAM cell, two cross-coupled inverters are responsible for maintaining data stability, while additional access transistors are controlled by the WL to allow interaction with the bit lines during writing. Designing a test schematic specifically for this operation enables engineers to verify the cell’s functionality under simulated conditions, ensuring that it writes data accurately and meets performance requirements.</dd>
</dl>

```
$  ngspice untitled1.sch 
```

![](https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs/blob/main/Screenshot%20from%202024-11-08%2023-43-51.png)

**Simulation Waveform :**
<dl>
  <dd>The waveform analysis in the SRAM write operation test schematic is critical for understanding the behavior of each control signal and how it impacts the storage of data within the 6T SRAM cell. A typical write operation waveform includes pulses for the bit lines (BL and BLB) and the word line (WL), which together determine the successful writing of data. Observing these waveforms allows engineers to verify that each signal reaches its expected voltage levels and adheres to the timing requirements necessary to perform a stable write. For instance, a logic 1 write is achieved by setting BL high (e.g., 1.8V) and BLB low (0V), while a logic 0 write inverts these voltages. The waveform patterns generated during these operations help assess whether the bit lines and WL synchronize effectively. </dd>
</dl>

```
$  ngspice sram.spice 
```

![](https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs/blob/main/WhatsApp%20Image%202024-11-08%20at%2011.59.13%20PM.jpeg)

SPICE Configuration for 1-Bit 6T SRAM Write Operation with VPULSE sources

* Define Vdd supply voltage
Vdd vdd 0 1.8V

* VPULSE Block for SRAM Write Operation
* This setup writes a logic "1" to the SRAM cell by default (BL = 1.8V, BLB = 0V)
* Modify V1 and V2 for BL and BLB to change the write data

* Word Line (WL) Pulse - Controls the write access
VWL WL 0 PULSE(0 1.8 5n 1n 1n 10n 20n)  ; Activates the cell for writing

* Bit Line (BL) Pulse - Data signal for logic "1" (set to 1.8V)
VBL BL 0 PULSE(0 1.8 5n 1n 1n 10n 20n)   ; Set V2 to 1.8V for writing "1"

* Bit Line Bar (BLB) Pulse - Complementary data signal for logic "1" (set to 0V)
VBLB BLB 0 PULSE(1.8 0 5n 1n 1n 10n 20n) ; Set V2 to 0V for writing "1"

* To write a logic "0", adjust BL and BLB as follows:
* VBL BL 0 PULSE(1.8 0 5n 1n 1n 10n 20n)   ; Set V2 to 0V for BL
* VBLB BLB 0 PULSE(0 1.8 5n 1n 1n 10n 20n) ; Set V2 to 1.8V for BLB

* Simulation settings
.tran 0.01n 20n    ; Time step and total simulation time
.save all          ; Save all variables for analysis

.end
# Future Work
* Design of memory array

# Author
* Vijay

# Acknowledgements  
* Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd.
* Yash Kumar, VSD Teaching Assistant  - laryash99@gmail.com
* Reuel Reuben, VSD Teaching Assistant  -reuel992000@gmail.com
* Nickson Jose,, VSD Teaching Assistant

# Contact Information  
* Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. - kunalghosh@gmail.com








