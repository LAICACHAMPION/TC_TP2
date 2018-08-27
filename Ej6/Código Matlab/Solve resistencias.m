syms r1 r2 r3 vs positive


%seteo el sistema de ecuaciones del circuito 
[R2,R3] = solve(...
r2*(1/r1 + 1/r3) + 1 -50==0,...
-17.5 + r2/r1*vs==0,...
[r2 r3])
% vs = 7;
% pretty();