clear all;
close all;
a=csvread('x01.csv');
b=csvread('x1.csv');
c=csvread('x10.csv');
freca=a(:,1).*1000;
frecb=b(:,1).*1000;
frecc=c(:,1).*1000;
gaina=20*log10(a(:,3)./a(:,2));
gainb=20*log10(b(:,3)./b(:,2));
gainc=20*log10(c(:,3)./c(:,2));

semilogx(freca,gaina);
hold on;
semilogx(frecb,gainb);
semilogx(frecc,gainc);
hold off;