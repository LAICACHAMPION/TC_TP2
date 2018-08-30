
A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet

s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=200e3;
H=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
Gideal=-r2/r1;
w=[5000*2*pi:10:50000000*2*pi];
[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
mag=((abs(mag-abs(Gideal)))./abs(Gideal)).*100;


semilogx(w./(2*pi),mag);