close all;
clear all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet

s=tf('s');
r1=50e3;
r3=r1;
r2=5e3;
r4=100e3;
A=A0/(1+(s/wp));
H=(A*r4*(r1+r2))/((r1+r2+(A*r1))*(r3+r4));



w1=[130000*2*pi:10:10000000*2*pi];

superponedor('Bode caso 3','circuitob_ninv_caso3_bode.csv','circuitob_ninv_caso3_bode_simulacion.csv',H,w1,'s');