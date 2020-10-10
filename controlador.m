clc;
close all;

t = [0:0.001:2.5]                                           % periodo de estabilizacao
G = tf([4545 0], [1 3.199 5.2212])  
G1 = tf([-0.0002 -10], [1 3.199 5.2212])                    % controlador
G3 = feedback(G*G1, 1)                                      % Controlador do sistema em malha fechada
G4 = tf([-0.0002*-0.6 -10*-0.5], [1 3.199 5.2212]);         
figure, step(G4)
figure, step(G3, 'm')