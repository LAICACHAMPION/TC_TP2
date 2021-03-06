clear all;
close all;

A0=10e4; %%dato sacado del grafico
wp=2*pi*12; %%frecuencai da corte obtenida del datasheet
sr=0.5e6;
s=tf('s');
r1=5e3;
r3=r1;
r2=50e3;
r4=20e3;
Dm=csvread('circuito_n_caso1_Zin.csv');
Ds=csvread('circuito_n_caso1_Zin_sim.csv');
w=[9000*2*pi:10:400000*2*pi];


Av=A0/(1+(s/wp));
H=(r3+r4)*(s/s);



[mag,phase,wout] = bode(H,w);
mag=squeeze(mag);
phase=squeeze(phase);


R=33000;
%R=220e3;
ir=Dm(:,2)-(Dm(:,3).*exp(Dm(:,4).*((1i*pi)/180)));
ir=ir./R;
z=(Dm(:,3).*exp(-Dm(:,4).*((1i*pi)/180)))./ir;
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
semilogx(Ds(:,1),Ds(:,3)-180,'LineWidth',3);
semilogx(w./(2*pi),phase,'LineWidth',3);
formataxes('', 'Frecuencia (Hz)', 'Fase ($\circ$)', ... % titulo y ejes
                    'Medici\''on','Simulaci\''on ','C\''alculo')% legends

hold off;