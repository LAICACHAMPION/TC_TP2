r1 = 2.19e3; r2 = 145e3; r3 = 98e3; %valores medidos!
G = 1+r2/r1; %ganancia ideal (Ao infinito)


s = tf('s');
Ao = 10^(110/20); % de la hoja de datos: Ao=110dB
BWP = 16e6;
fp = BWP/Ao; 
wp = 2*pi*fp;
fpp = BWP/G; %fp prima
wpp = 2*pi*fpp;

% %%% con un polo
% Avol = Ao/(1+s/wp);
% G1P = Avol*G/(G+Avol);
% % opt = bodeoptions();
% % opt.FreqUnits = 'Hz';
% % bode(G, opt)
% 
%%%con dos polos
syms w2;
wo = sqrt((G+Ao)*wp*w2/G);
w2 = eval(solve(wo == 120e3*2*pi,w2));
Avol = Ao/(1+s/wp)/(1+s/w2);
wo = eval(wo);
xi = wo/2 * G/Ao/wp;
G2P = Avol*G/(G+Avol);

%%% con capacitor
Avol = Ao/(1+s/wp);
copam = 12e-12;
k = copam * (r1*r2 + r1*r3 + r2*r3);
Hc = G / (k/wp/(Ao*r1) * s^2 + (r1+r2)/wp/(Ao*r1) * s + 1);

wo = sqrt(wp*Ao*r1/k);
xi = wo/2 * k/Ao/r1;

w = 2*pi*logspace(1, 7, 100);
%superponedor('', 'tc_tp2_ej2 bode.csv', 'tc_tp2_ej2_spice.csv', Hc, w);
% figure;
% opt = bodeoptions(); opt.FreqUnits = 'Hz';
% bode(Avol, w, opt); grid on;


cpunta = 15e-12; rpunta = 10e6;
Zpunta =  1/(s*cpunta+1/rpunta);
Zopam = 1/(s*copam);
Zin = r3 + 1/(1/Zpunta+1/(Zopam+r1));
w = 2*pi*logspace(3, 6, 1000);
superponedor('', 'tc_tp2_ej2 Zin.csv', '', Zin, w);
