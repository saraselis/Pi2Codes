clc;
close all;

t = [0:0.01:2.5];                                               % periodo de estabilizacao Ts=2.5
A = 10;                                                         % constante diferencial da equacao
B = 0.3373;
s1 = -2.2727+67.3817j                                           % raizes complexas do sistema
s2 = -2.2727-67.3817j;              
I = A*exp(s1*t)+B*exp(s2*t);

hold on;
plot(t, I, 'm')

C = 0.00022;
R = 1000;
L = 0.1;
numerador = [1/C 0];
denominador = [1 1/(R*C) 1(L*C)];
Hs = tf(numerador, denominador)                                 % funcao de transferencia.


title('Circuito', 'FontName', 'Arial', 'FontSize', 24);
xlabel('Tempo s', 'FontName', 'Arial', 'FontSize', 18);
ylabel('Amplitude m', 'FontName', 'Arial', 'FontSize', 18);
grid on;
figure, step(Hs)                                                % plotando o grafico utilizando um degrau como entrada
