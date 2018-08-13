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
Avol=sym('Avol');
A0=10^(100/20); %%dato sacado del grafico
wp=2*pi*6 %%frecuencai da corte obtenida del datasheet
%circuito a
Gi=-R2/R1;
Gni=(1/(((R2 -R3)/(Avol*R2*R3))-(1/R2)))*(1/R1);
('Gni')
pretty(simplify(Gni));
('Zin')
k=((R3-(R2/Avol))/(R2*R3));
Zin=((R1*Avol*k)-1)/(Avol*k);
pretty(simplify(Zin));
limit(Zin,Avol,inf)

%circuito b

k1=R3/(R3+R4);
k2=R1/(R1+R2);

Gib=(R2*R3)/(R1*(R3+R4));
Grb=(Avol*k1)/((k2*Avol)+1);
pretty(Grb);
pretty(simplify(Grb));
limit(Grb,Avol,inf)

