v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 20 -150 410 -150 {lab=#net1}
N 340 -130 370 -130 {lab=#net2}
N 370 -130 370 50 {lab=#net2}
N 370 50 410 50 {lab=#net2}
N 340 -110 380 -110 {lab=#net3}
N 380 -110 380 -40 {lab=#net3}
N 380 -40 410 -40 {lab=#net3}
N 340 -50 490 -50 {lab=#net4}
N 490 -140 490 -50 {lab=#net4}
N 490 -140 510 -140 {lab=#net4}
N 340 -70 360 -70 {lab=qb}
N 340 -90 360 -90 {lab=q}
N 30 -110 40 -110 {lab=GND}
N 30 -110 30 -80 {lab=GND}
N 20 -130 40 -130 {lab=#net1}
N 20 -150 20 -130 {lab=#net1}
C {sram.sym} 190 -90 0 0 {name=x1}
C {vsource.sym} 510 -110 0 0 {name=V1 value="pulse(0 1.8 0 1n 1n 5n 10n 2)" savecurrent=false}
C {vsource.sym} 410 -120 0 0 {name=V2 value=1.8 savecurrent=false}
C {vsource.sym} 410 -10 0 0 {name=V3 value="pulse(1.8 0 0 1n 1n 5n 10n 2)" savecurrent=false}
C {vsource.sym} 410 80 0 0 {name=V4 value="pulse(0 1.8 0 1n 1n 5n 10n 2)" savecurrent=false}
C {gnd.sym} 410 110 0 0 {name=l1 lab=GND}
C {gnd.sym} 410 20 0 0 {name=l2 lab=GND}
C {gnd.sym} 510 -80 0 0 {name=l3 lab=GND}
C {gnd.sym} 410 -90 0 0 {name=l4 lab=GND}
C {gnd.sym} 30 -80 0 0 {name=l5 lab=GND}
C {opin.sym} 360 -90 0 0 {name=p1 lab=q}
C {opin.sym} 360 -70 0 0 {name=p2 lab=qb}
C {code_shown.sym} 50 150 0 0 {name = s1 
only_toplevel = false 
value = "/home/vijay/xschem/sky130_fd_pr/models/sky130.lib.spice tt
.tran 0.01n 20n
.save all
.end"
}
