close all;
clear all;

syms f;

r1=47e3;
r2=1e6;
c=1e-6;
zc=-j/(2*pi*f*c);
s1=zc+r1
p1=s1*r1/(s1+r1);
s2=zc+p1;
zin=r2*s2/(r2+s2);
zin = simplify(zin);
zin


