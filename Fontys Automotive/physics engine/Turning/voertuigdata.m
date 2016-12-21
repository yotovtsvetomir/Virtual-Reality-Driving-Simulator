% ACE2 VOERTUIGMODEL/MATLAB/SIMULINK
% S. de Goede
%
% voertuigdata.m geeft alle benodigde data voor het enkelsporige
% voertuigmodel: Voertuigmodel.mdl
%            
% 
close all, clear all, clc;
%
m = 1150;                           % vehicle mass [kg]
g = 9.81;                           % gravity [m/s2]
L = 2.66;                           % wheelbase length  [m]
a = 1.06;                           % distance from front wheel to centre [m]
b = L-a;                            % distance from rear wheel to centre [m]
J = 1850;                           % moment of inertia of vehicle on z- axis [kgm2]
%
% NONLINEAIRE BAND PARAMETERS tbv de MAGIC FORMULA 
% H.B. Pacejka: 
% vereenvoudigde bandmodel beschrijving
%
%       Fy = D.sin[CC.atan{B.x-E.(B.x-atan(B.x))}]
%
% Index 1: vooras, 2: achteras
% piekfactor D is proportioneel aan de asbelasting
% 
% understeer factor
eta = 0.03;                         % een aannemelijk maximale waarde is 0.04
%
Fz0 = 8000;                         % nominal load [N]
Fz1 = m*g*b/L;                      % axle load voor [N]
Fz2 = m*g*a/L;                      % axle load achter [N]
dFz1 = (Fz1-Fz0)/Fz0;
dFz2 = (Fz2-Fz0)/Fz0;
mu1 = 0.9;                          % coefficient of friction voor [-]
mu2 = 0.9;                          % coefficient of friction achter [-]
D1 = mu1*(-0.145*dFz1+0.99)*Fz1;    % piekfactor voor [N]
D2 = mu2*(-0.145*dFz2+0.99)*Fz2;    % piekfactor achter [N]
C1 = 1.19;                          % vormfactor voor [-]
C2 = 1.19;                          % vormfactor achter [-] 
K1 = 14.95 * Fz0 * sin(2 * atan(Fz1 / 2.13 / Fz0));
K2 = Fz2 * K1 / (Fz1 - eta * K1);
B1 = K1/C1/D1;                      % stijfheidfactor voor %B2=K1/C1/D1;   
B2 = K2/C2/D2;                      % stijfheidfactor achter %B2=K1/C1/D1;   
E1 = -1.003-0.537*dFz1;             % krommingsfactor voor
E2 = -1.003-0.537*dFz2;             % krommingsfactor achter
%
% LINEAIRE BAND PARAMETERS
% Slipstijfheid gedefinieerd op basis van de nonlineaire bandkarakteristiek 
%
Cy_voor=B1*C1*D1;                   % slipstijfheid voor [N/rad]
Cy_achter=B2*C2*D2;                 % slipstijfheid achter [N/rad]
%
% INPUT PARAMETERS tbv SIMULATIE
%
v = 80;                             % vehicle velocity [km/h]
v = v/3.6;                          % vehicle velocity [m/s]
factor = 2;                         % steer factor (yaw) [deg]
