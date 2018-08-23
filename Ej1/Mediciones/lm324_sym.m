clear all;
close all;

%LM324 - especificaciones
%fuente:http://www.ti.com/lit/ds/symlink/lm224.pdf
SR=0.5/(1e-6); %Voly/Sec
BWP= 1.2e6; %HZ
Avol=100e3;
%**************************

F1=54e3;
G1=10;
BWP1=F1*G1;

G2=1;
BW2calc=BWP1/G2
BW2simulado=400e3;
(BW2calc-BW2simulado)/BW2simulado