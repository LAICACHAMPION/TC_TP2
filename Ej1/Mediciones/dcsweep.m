D=csvread('dcsweep_ca_c1.csv');
D=D(:,2:3);
plot(D(:,1),D(:,2),'-o')