clear all;
close all;
r=5000;
a=csvread('zx1.csv');
freca=a(:,1).*1000;
ia=a(:,3)./(2*r);
za=a(:,2)./(2.*ia);
semilogx(freca,za);