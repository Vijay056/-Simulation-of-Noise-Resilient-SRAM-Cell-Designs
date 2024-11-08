v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -140 -30 -140 60 {lab=vin}
N -100 -0 -100 30 {lab=vout}
N -10 40 -10 90 {lab=GND}
N -100 90 -10 90 {lab=GND}
N -170 20 -140 20 {lab=vin}
N -10 -60 -10 -20 {lab=#net1}
N -100 -60 -10 -60 {lab=#net1}
N -100 20 -50 20 {lab=vout}
N -170 20 -170 70 {lab=vin}
N -50 0 -50 20 {lab=vout}
C {vsource.sym} -10 10 0 0 {name=V1 value=1.8V savecurrent=false}
C {gnd.sym} -60 90 0 0 {name=l1 lab=GND}
C {vsource.sym} -170 100 0 0 {name=V2 value="PULSE(0 1.8 0.5n 100p 100p 1n 2n)" savecurrent=false}
C {gnd.sym} -170 130 0 0 {name=l2 lab=GND}
C {lab_pin.sym} -170 30 0 0 {name=p1 sig_type=std_logic lab=vin}
C {lab_pin.sym} -50 0 0 0 {name=p2 sig_type=std_logic lab=vout}
C {nmos.sym} -120 60 0 0 {name=M2 model=M2N7002 device=2N7002 footprint=SOT23 m=1}
C {pmos.sym} -120 -30 0 0 {name=M4 
model=DMP2035U 
device=DMP2035U 
m=1}
C {code_shown.sym} 40 110 0 0 {name=s1 only_toplevel=false value="
.tran 100p 10n
.save all"}
