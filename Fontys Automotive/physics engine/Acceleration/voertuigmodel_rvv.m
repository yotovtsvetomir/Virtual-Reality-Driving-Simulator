%% Clean up
clear all
clc
%% Voertuigparameters
Cw=0.3;         % Cw-waarde [-]
rho=1.29;       % Luchtdichtheid [kg/m3]
A=2.25;         % Frontaal oppervlak [m^2]
m=950;          % Voertuigmassa [kg]  
g=9.81;         % Gravitatieversnelling [m/s^2]
fr=0.014;       % Rolweerstandcoefficient [-]
mu_max=1.05;    % Maximale wrijvingscoefficient [-] 
r=0.3;          % Bandstraal [m]       
J1=1.2;         % Traagheid ververbrandingsmotor [kgm^2]
J2=5.4;         % Traagheid wielen en aandrijving [kgm^2]

%% Overbrenginsverhouding [-]
% i1=12;
% i2=7.5;
% i3=5.5;
% i4=4.5;
% i5=3.75;
i=[1 2 3 4 5; 12 7.5 5.5 4.5 3.75]';

%% Schakelgedrag
v_i=[1 2 3 4 5;0 4.17 8.89 13.89 19.44]';
%% Motorkoppel
Nm_motor=[0 1000 2000 3000 4000 5000 6000 6500 7000; 50 90 90 95 100 90 85 80 0]';
%% Inlezen excelbestand
NEDC=xlsread('NEDC.xlsx');
% NEDC=NEDC';
% save('NEDC_1', 'NEDC');
%% Run Simulinkmodel
simtijd=1180;      % Simulatietijd [s]
sim('voertuig_cvs1.mdl');