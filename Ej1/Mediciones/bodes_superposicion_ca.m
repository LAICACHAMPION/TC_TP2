close all;
clear all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet

s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=20e3;
H=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
w1=[5000*2*pi:10:90000*2*pi];

superponedor('Caso-1','circuito_inv_caso1_bode.csv','circuito_inv_caso1_bode_simulacion.csv',H,w1,'save');
