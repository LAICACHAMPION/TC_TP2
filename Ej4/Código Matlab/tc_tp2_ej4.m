r = 15e3; c = 6.8e-9;

Ao = exp(110/20); % de la hoja de datos: Ao=110dB
BWP = 16e6;
wp = BWP/Ao;
opt = bodeoptions();
opt.FreqUnits = 'Hz';

s = tf('s');
w = logspace(1, 9, 10000);

% %%derivador
% z1 = 1/s/c;
% z2 = r;

% %%%integrador
z1 = r;
z2 = 1/s/c;

G = -z2/z1; %ganancia ideal (Ao infinito)
opt.Title.String = 'Diagrama de Bode: derivador, Ao infito';
bode(G, w, opt);

G = -Ao*z2/(z2+(Ao+1)*z1);
opt.Title.String = 'Diagrama de Bode: derivador, Ao constante';
figure;
bode(G, w, opt);

Avol = Ao/(1+s/wp);
G = -Avol*z2/(z2+(Avol+1)*z1);
opt.Title.String = 'Diagrama de Bode: derivador, A(s)';
figure;
bode(G, w, opt);


% %derivador compensado con Rs =470ohm
% rs = 470;
% z1 = rs+1/s/c; z2 = r;

%% integrador compensado con Rp = 27k
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

Avol = Ao/(1+s/wp);
G = -Avol*z2/(z2+(Avol+1)*z1);
opt.Title.String = 'Diagrama de Bode: integrador compensado, A(s)';
hold on;
bode(G, w, opt);


% Hcomp = -Ao*r*c*s/(c/wp*(r+r2)*s^2+(1/wp+c*(r+r2*(1+Ao)))*s+1+Ao);
% w0 = sqrt(wp*(1+Ao)/c/(r+r2));
% xi = w0/2*(c*(r+r2*(1+Ao))+1/wp)/(1+Ao);
% r2 = solve(xi == 0.707, r2);
%%da 462ohm


% r2 = 470;
% Hcomp = -Ao*r*c*s/(c/wp*(r+r2)*s^2+(1/wp+c*(r+r2*(1+Ao)))*s+1+Ao);


% %%% integrador compensado 
% r2 = 500;
% z1 = r;
% z2 = 
% 
