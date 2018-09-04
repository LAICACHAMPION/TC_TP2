r = 15e3; c = 6.8e-9;

Ao = 10^(110/20); % de la hoja de datos: Ao=110dB
BWP = 16e6;
wp = 2*pi*BWP/Ao;
opt = bodeoptions();
opt.FreqUnits = 'Hz';

s = tf('s');
w = 2*pi*logspace(0, 6, 10000);

%%derivador
% z1 = 1/s/c+470;
% z2 = r;

% %%%integrador
% z1 = r;
% z2 = 1/s/c;

% G = -z2/z1; %ganancia ideal (Ao infinito)
% opt.Title.String = 'Diagrama de Bode: derivador, Ao infito';
% 
% Zin = z1;
%bode(Zin, w, opt);

% hold on;
% G = -Ao*z2/(z2+(Ao+1)*z1);
% Zin = z2/(Ao+1)+z1;
% opt.Title.String = 'Diagrama de Bode: derivador, Ao constante';
%figure;
% bode(Zin, w, opt);
% hold on;
% grid on;

Avol = Ao/(1+s/wp);
% G = -Avol*z2/(z2+(Avol+1)*z1);
% Zin = z2/(Avol+1)+z1;
% opt.Title.String = 'Diagrama de Bode: derivador, A(s)';
% bode(Zin, w, opt);


%derivador compensado con Rs =470ohm
% rs = 470;
% z1 = rs+1/s/c; z2 = r;

%integrador compensado con Rp = 27k
rp = 27e3;
z1 = r; z2 = (s*c+1/rp)^-1;
% G = -z2/z1; %ganancia ideal (Ao infinito)
% opt.Title.String = 'Diagrama de Bode: derivador compensado, Ao infito';
% hold on;
% bode(G,w, opt);

% G = -Ao*z2/(z2+(Ao+1)*z1);
% opt.Title.String = 'Diagrama de Bode: derivador compensado, Ao constante';
%figure;
%bode(G, opt);

% w2 = 3.7998e+05;
% Avol = Ao/(1+s/wp)/(1+s/w2);
G = -Avol*z2/(z2+(Avol+1)*z1);
Zin = z2/(Avol+1)+z1;
% opt.Title.String = 'Diagrama de Bode: integrador compensado, A(s)';
% hold on;
% bode(Zin, w, opt);
% % 

% Hcomp = -Ao*r*c*s/(c/wp*(r+r2)*s^2+(1/wp+c*(r+r2*(1+Ao)))*s+1+Ao);
% w0 = sqrt(wp*(1+Ao)/c/(r+r2));
% xi = w0/2*(c*(r+r2*(1+Ao))+1/wp)/(1+Ao);
% r2 = solve(xi == 0.707, r2);
%%da 462ohm

% 
% r2 = 470;
% Hcomp = -Ao*r*c*s/(c/wp*(r+r2)*s^2+(1/wp+c*(r+r2*(1+Ao)))*s+1+Ao);


% %%% integrador compensado 
% r2 = 500;
% z1 = r;
% z2 = 
% 


%superponedor('','tc_tp2_ej4_d_Hf.csv','tc_tp2_ej4_d_Hf spice.csv', G, w, 'tc_tp2_ej4_d_Hf');
%superponedor('','tc_tp2_ej4_d_Zin.csv','tc_tp2_ej4_d_Zin spice.csv', Zin, w, 'tc_tp2_ej4_d_Zin');
%superponedor('','tc_tp2_ej4_dcomp_Hf.csv','tc_tp2_ej4_dcomp_Hf spice.csv', G, w, 'tc_tp2_ej4_dcomp_Hf');
%superponedor('','tc_tp2_ej4_dcomp_Zin.csv','tc_tp2_ej4_dcomp_Zin spice.csv', Zin, w, 'tc_tp2_ej4_dcomp_Zin');

%superponedor('','tc_tp2_ej4_i_Hf.csv','tc-tp2-ej4-i-hf.csv', G, w, 'tc_tp2_ej4_i_Hf');
%superponedor('','tc_tp2_ej4_i_Zin.csv','tc-tp2-ej4-i-Zin.csv', Zin, w, 'tc_tp2_ej4_i_Zin');
superponedor('','tc_tp2_ej4_icomp_Hf.csv','tc-tp2-ej4-icomp-hf.csv', G, w, 'tc_tp2_ej4_icomp_Hf');
%superponedor('','tc_tp2_ej4_icomp_Zin.csv','tc_tp2_ej4_icomp_Zin spice.csv', Zin, w, 'tc_tp2_ej4_icomp_Zin');



% 
% r = 15e3; c = 6.8e-9;
% Ao = 10^(110/20); % de la hoja de datos: Ao=110dB
% BWP = 16e6;
% wp = 2*pi*BWP/Ao;
% syms r2;
% w0 = sqrt(wp*(1+Ao)/c/(r+r2));
% xi = w0/2*(c*(r+r2*(1+Ao))+1/wp)/(1+Ao);
% r2 = solve(xi == 0.707, r2);
% % 
