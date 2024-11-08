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
- [Prelayout Schematic and Simulation waveforms](#Prelayout-Schematic-and-Simulation-waveforms)
- [Stability Analysis of 6T-SRAM cell](##Stability-Analysis-of-6T-SRAM-cell)
- [Layouts and Postlayout Simulation waveforms](#Layouts-and-Postlayout-Simulation-waveforms)
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
$  git clone https://github.com/vijay/sram_sky130.git
$  cd sram_sky130
$  chmod +777 install_and_clone.sh
$  ./install_and_clone.sh

```
Note: Running script install_and_clone.sh will install ngspice tool and clone to required Google-skywater(sky130) PDK.

<dl>
  <dd> 3. Simulation of Basic CMOS inverter: Basic check for installation </dd>
</dl>

```
$    cd sram_sky130/Ngspice_Netlist/Prelayout/ 
$    ngspice inv.spice 
```


## SRAM Memory Architecture

![](https://github.com/Vijay056/-Simulation-of-Noise-Resilient-SRAM-Cell-Designs/blob/main/micromachines-14-00581-g003.webp)

## Inputs to OpenRAM compiler
Below images the show the inputs required to openRAM compiler:

![]([https://github.com/Deepak42074/vsdsram_sky130/blob/main/Others/Openram_Compiler.png](https://www.mdpi.com/micromachines/micromachines-14-00581/article_deploy/html/images/micromachines-14-00581-g003-550.jpg))

Custom cells required:
* SRAM bit cell

# Prelayout Schematic and Simulation waveforms
The Schematics are drawn using opensource xschem tool and simulation is performed using Ngspice,both are configured with sky130 library.


## 1. 6T_SRAM cell 
The standard 1-bit 6T - SRAM cell consists of 6 transistors. It has pair of cross-coupled CMOS inverters and two NMOS access transistors(M5, M6). 
The NMOS transistors (M2, M4) and PMOS transistors(M1,M3) are driver and pull up transistors respectively.

**Circuit Diagram :**

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Schematics/6T_sram_cell.png)

**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>

```
$  ngspice 6T_sram_cell.spice 
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/6T_sram_cell.png)



## 8. 1bit_sram_write 
**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>
 
```
$  ngspice 1bit_write_read.spice
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/1bit_sram_write.png)



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








