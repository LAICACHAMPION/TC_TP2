close all;
clear all;

componentes=[5 50 5 20; 5 5 5 20;50 5 50 100];
%compoenetes
%filas numero de caso
%columnas R1 , R2 ... R4

R1 = sym('R1');
R2 = sym('R2');
R3 = sym('R3');
R4 = sym('R4');
R5 = sym('R5');
s = sym('s');
Avol=sym('Avol');
A0=10e4; %%dato sacado del grafico
wp=2*pi*11.5; %%frecuencai da corte obtenida del datasheet
%circuito a

Gideal=-R2/R1;
Greal=-Avol*R2*R3/((Avol*R1*R3)+(R2*R3)+(R1*R3)+(R1*R2));
%pretty(Greal);
s=tf('s');
r1=50e3;
r3=50e3;
r2=5e3;
r4=100e3;
H=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
opt = bodeoptions();
w=[1000:5:8000000];
opt.FreqUnits = 'Hz';
bode(H,w,opt);

