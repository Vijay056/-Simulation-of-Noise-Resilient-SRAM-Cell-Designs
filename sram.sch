v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 390 -300 390 -190 {lab=q}
N 560 -300 560 -190 {lab=qb}
N 560 -190 570 -190 {lab=qb}
N 430 -330 430 -160 {lab=qb}
N 520 -330 520 -160 {lab=q}
N 520 -160 530 -160 {lab=q}
N 390 -130 570 -130 {lab=gnd}
N 390 -360 560 -360 {lab=vdd}
N 390 -280 520 -280 {lab=q}
N 430 -250 560 -250 {lab=qb}
N 580 -270 580 -250 {lab=qb}
N 560 -270 580 -270 {lab=qb}
N 310 -220 390 -220 {lab=q}
N 280 -380 280 -260 {lab=WL}
N 280 -380 610 -380 {lab=WL}
N 610 -380 610 -290 {lab=WL}
N 200 -220 250 -220 {lab=bl}
N 640 -250 690 -250 {lab=blb}
N 480 -410 480 -360 {lab=vdd}
N 480 -130 480 -80 {lab=gnd}
N 350 -250 390 -250 {lab=q}
N 560 -220 690 -220 {lab=qb}
N 280 -160 390 -160 {lab=gnd}
N 280 -220 280 -160 {lab=gnd}
N 570 -160 610 -160 {lab=gnd}
N 610 -250 610 -160 {lab=gnd}
N 610 -160 610 -110 {lab=gnd}
N 480 -110 610 -110 {lab=gnd}
N 280 -160 280 -100 {lab=gnd}
N 280 -100 480 -100 {lab=gnd}
N 360 -330 390 -330 {lab=vdd}
N 360 -360 360 -330 {lab=vdd}
N 360 -360 390 -360 {lab=vdd}
N 560 -330 590 -330 {lab=vdd}
N 590 -360 590 -330 {lab=vdd}
N 560 -360 590 -360 {lab=vdd}
C {ipin.sym} 480 -410 0 0 {name=p1 lab=vdd}
C {iopin.sym} 200 -220 0 1 {name=p2 lab=bl}
C {opin.sym} 350 -250 0 1 {name=p3 lab=q}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 410 -160 0 1 {name=M1
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 550 -160 0 0 {name=M2
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 280 -240 1 0 {name=M3
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/nfet_01v8.sym} 610 -270 3 1 {name=M4
W=1
L=0.15
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/pfet_01v8_lvt.sym} 540 -330 0 0 {name=M5
W=1
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {/home/vijay/xschem/xschem_sky130/sky130_fd_pr/pfet_01v8_lvt.sym} 410 -330 0 1 {name=M6
W=1
L=0.35
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8_lvt
spiceprefix=X
}
C {ipin.sym} 480 -80 0 0 {name=p4 lab=gnd}
C {iopin.sym} 610 -380 0 0 {name=p5 lab=WL}
C {iopin.sym} 690 -250 0 0 {name=p6 lab=blb}
C {opin.sym} 690 -220 0 0 {name=p7 lab=qb}
