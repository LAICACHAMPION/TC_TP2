close all;
clear all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet
sr=0.5e6;
s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=20e3;
H1=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
G1=-r2/r1;
w1=[5000*2*pi:10:500000*2*pi];
[mag1,phase1,wout1] =bode(H1,w1);
mag1=squeeze(mag1);
mag1=mag1.*(w1')./2;
semilogx(w1./(2*pi),((mag1.^(-1)).*sr),'LineWidth',3);
hold on;


r1=5e3;
r3=5e3;
r2=5e3;
r4=20e3;
H2=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
w2=[40000*2*pi:10:4000000*2*pi];
[mag2,phase2,wout2] =bode(H2,w2);
mag2=squeeze(mag2);
mag2=mag2.*(w2')./2;
semilogx(w2./(2*pi),((mag2.^(-1)).*sr),'LineWidth',3);



r1=50e3;
r3=50e3;
r2=5e3;
r4=100e3;
H3=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
w3=[170000*2*pi:10:10000000*2*pi];
[mag3,phase3,wout3] =bode(H3,w3);
mag3=squeeze(mag3);
mag3=mag3.*(w3')./2;
semilogx(w3./(2*pi),((mag3.^(-1)).*sr),'LineWidth',3);

formataxes('', 'Frecuencia (Hz)', 'Tensi\''on peak-to-peak (V)', ... % titulo y ejes
                    'Caso-1','Caso-2','Caso-3')% legends

hold off;