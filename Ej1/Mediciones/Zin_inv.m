clear all;
close all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet
sr=0.5e6;
s=tf('s');
r1=50e3;
r3=50e3;
r2=5e3;
r4=100e3;
Dm=csvread('circuito_inv_caso3_Zin_100k.csv');
Ds=csvread('circuito_inv_caso3_Zin_sim.csv');
w=[100000*2*pi:10:10000000*2*pi];


Av=A0/(1+(s/wp));
H=((r2*r3)+r1*(r3*(Av+1)+r2))/(r3*(Av+1)+r2);



[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
phase=squeeze(phase);


R=100000;
ir=Dm(:,2)-(Dm(:,3).*exp(Dm(:,4).*((1i*pi)/180)));
ir=ir./R;
z=(Dm(:,3).*exp(Dm(:,4).*((1i*pi)/180)))./ir;
figure;
semilogx(Dm(:,1).*1000,abs(z),'-o')
hold on;
semilogx(Ds(:,1),10.^(Ds(:,2)./20),'LineWidth',3);
semilogx(w./(2*pi),mag,'LineWidth',3);
formataxes('', 'Frecuencia (Hz)', 'Impedancia (ohm)', ... % titulo y ejes
                    'Medici\''on','Simulaci\''on ','C\''alculo')% legends
hold off;

figure
hold on;

semilogx(Dm(:,1).*1000,(angle(z).*(180/pi)),'-o')
semilogx(Ds(:,1),Ds(:,3),'LineWidth',3);
semilogx(w./(2*pi),phase,'LineWidth',3);
formataxes('', 'Frecuencia (Hz)', 'Fase ($\circ$)', ... % titulo y ejes
                    'Medici\''on','Simulaci\''on ','C\''alculo')% legends

hold off;