close all;
clear all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet

s=tf('s');
r1=5e3;
r3=5e3;
r2=50e3;
r4=20e3;
Av=(A0/(1+(s/wp)));
H1=(Av*r4*(r1+r2))/((r1+r2+r1*Av)*(r3+r4));
G1=(r4*(r1+r2))/(r1*(r3+r4));
%H1=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
%G1=-r2/r1;
w1=[5000*2*pi:10:500000*2*pi];
[mag1,phase1,wout1] =bode(H1,w1);
mag1=squeeze(mag1);
semilogx(w1./(2*pi),20*log10(mag1),'LineWidth',3);
hold on;
s1=size(w1);
semilogx(w1./(2*pi),20*log10(ones(s1(2),1)*abs(G1)),'LineWidth',3);

r1=5e3;
r3=5e3;
r2=5e3;
r4=20e3;
%H2=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
H2=(Av*r4*(r1+r2))/((r1+r2+r1*Av)*(r3+r4));
G2=(r4*(r1+r2))/(r1*(r3+r4));
w2=[40000*2*pi:10:4000000*2*pi];
[mag2,phase2,wout2] =bode(H2,w2);
mag2=squeeze(mag2);
semilogx(w2./(2*pi),20*log10(mag2),'LineWidth',3);
%G2=-r2/r1;
s2=size(w2);
semilogx(w2./(2*pi),20*log10(ones(s2(2),1)*abs(G2)),'LineWidth',3);



r1=50e3;
r3=50e3;
r2=5e3;
r4=100e3;
%H3=-(A0/(1+(s/wp)))*r2*r3/(((A0/(1+(s/wp)))*r1*r3)+(r2*r3)+(r1*r3)+(r1*r2));
H3=(Av*r4*(r1+r2))/((r1+r2+r1*Av)*(r3+r4));
G3=(r4*(r1+r2))/(r1*(r3+r4));
w3=[170000*2*pi:10:10000000*2*pi];
[mag3,phase3,wout3] =bode(H3,w3);
mag3=squeeze(mag3);
semilogx(w3./(2*pi),20*log10(mag3),'LineWidth',3);

%G3=-r2/r1;
s3=size(w3);
semilogx(w3./(2*pi),20*log10(ones(s3(2),1)*abs(G3)),'LineWidth',3);

formataxes('', 'Frecuencia (Hz)', 'Mangnitud (dB)', ... % titulo y ejes
                    'Caso-1 real','Caso-1 ideal','Caso-2 real','Caso-2 ideal','Caso-3 real','Caso-3 ideal')% legends

hold off;