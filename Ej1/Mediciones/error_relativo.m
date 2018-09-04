
A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet
s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=20e3;
%H=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
H=(Av*r4*(r1+r2))/((r1+r2+r1*Av)*(r3+r4));
Gideal=(r4*(r1+r2))/(r1*(r3+r4));
w=[9000*2*pi:10:900000*2*pi];
[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
mag=((abs(abs(mag)-abs(Gideal)))./abs(mag)).*100;


semilogx(w./(2*pi),mag,'r','LineWidth',3);
formataxes('','Frecuencia (Hz)','Error Relativo(\%)')% legends