clear;

f_min =10;
f_max = 30000;

frecuencia = f_min : f_max;
z_in = frecuencia;

for n = f_min : f_max
    f = n;
    z_in(n+1-f_min) = (212525681000000*pi^4*f^4 - pi^3*f^3*5522500000000000i + 15615750000000000*pi^2*f^2 - pi*f*125000000000000000i + 62500000000000000)/(9256171681*pi^4*f^4 + 277365750000*pi^2*f^2 + 62500000000);
end

figure;

subplot(2,1,1);
semilogx(frecuencia,abs(z_in));
hold on;
grid on;
xlabel('Frecuencia (KHz)');
ylabel('zinput');


subplot(2,1,2);
semilogx(frecuencia,angle(z_in).*(360/(2*pi)));
grid on;
xlabel('Frecuencia (KHz)');
ylabel('Fase');
set(gca,'ytick',-90:45:0);