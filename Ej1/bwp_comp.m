clear all;
close all;

x1=csvread('x1.txt');
x10=csvread('x10.txt');
x01=csvread('x01.txt');
semilogx(x1(:,1),x1(:,2))
hold on
semilogx(x10(:,1),x10(:,2))
semilogx(x01(:,1),x01(:,2))
hold off