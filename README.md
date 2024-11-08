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

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Others/SRAM_memory_architecture.png)

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

## 2. Precharge circuit

**Circuit Diagram :**

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Schematics/Prechargecell.png)


**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>

```
$  ngspice Prechargecell.spice 
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/Prechargecell.png)

## 3. Differential Sense Amplifier

**Circuit Diagram :**

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Schematics/Differential_sense_amplifier.png)

**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>

```
$  ngspice Differential_sense_amplifier.spice 
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/Differential_sense_amplifier.png)

 
 
## 7. 1bit_sram_read 

**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>
 
```
$  ngspice 1bit_sram_read.spice
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/1bit_sram_read.png)

## 8. 1bit_sram_write 
**Simulation Waveform :**
<dl>
  <dd> Type below command in Prelayout directory </dd>
</dl>
 
```
$  ngspice 1bit_write_read.spice
```

![](https://github.com/Deepak42074/vsdsram_sky130/blob/main/Simulation_Waveform/Prelayout/1bit_sram_write.png)



The four parameters A,B,C,D on above plot of Ncurve  define the stability of 6T-SRAM cell.

1. Static Voltage Noise Margin(SVNM) : It is the maximum DC voltage at the node Q before its state flips.It is the volatge difference between point A and C.

    SVNM = V(C) - V(A) = 0.84 - 0.18 = 0.66V
    
2. Static Current Noise Margin (SINM) : It is the peak current between first two crossing and it is the maximum tolerable DC current that can be injected into the SRAM cell     before it flips.

    SINM = I(B) = ~299 uA
    
3. Write Trip Voltage(WTV) : It is the voltage required before changing the contents of the internal node.It is the voltage difference between netween point C and E.
   
   WTV = V(E) - V(C) = 1.8 - 0.84 = 0.97
   
4. Write Trip Current(WTI) : It is the negative current which is needed to write the cell.
   
   WTI = I(D) = ~(-48 uA)
   
In Ncurve point A and E are stable points and point C is metastable point.

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








