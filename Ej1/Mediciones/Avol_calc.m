clear all;
close all;

W1=2*pi*54.08e3;
Gain1=10^((1/20)*(17));
BWP1=W1*Gain1
W2=2*pi*402.8e3;
Gain2=10^((1/20)*(-3.02));
BWP2=W2*Gain2
BWP1-BWP2