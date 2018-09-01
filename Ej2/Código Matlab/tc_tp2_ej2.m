r1 = 2.19e3; r2 = 145e3; r3 = 98e3; %valores medidos!
Gi = 1+r2/r1; %ganancia ideal (Ao infinito)


s = tf('s');
Ao = exp(110/20); % de la hoja de datos: Ao=110dB
BWP = 16e6;
wp = BWP/Ao; 

fpp = BWP/Gi; %fp prima
wpp = 2*pi*fpp;

%% con un polo
G = Gi/(1+s/wpp);
opt = bodeoptions();
opt.FreqUnits = 'Hz';
bode(G, opt)

%%con dos polos
wp2 = 10*wp;