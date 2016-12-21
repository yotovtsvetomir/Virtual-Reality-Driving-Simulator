clear all
close all

% get the measurement data (alpha and Fy)
load measurement

% set start values and bounds of the Magic Formula parameters to be optimised
%   B   C    D      E   alpha offset Fy offset
x0=[5   1.1  4400   0    0            0    ];  % start value
xl=[1   1    3000 -10   -0.01        -500  ];  % lower boundary
xu=[20  1.9  6000   1    0.01         500  ];  % upper boundary

% mode = 1: no graphics
% mode = 2: graphics during optimisation and slowed down

mode=2;   
options=optimset('Display','iter');
x=fmincon('objfun',x0,[],[],[],[],xl,xu,[],options,meas,mode);


figure
model.alpha= [-20:0.1:20]*pi/180;
model.Fy   = objfun(x,model,0);

plot(meas.alpha*180/pi,meas.Fy,'o',model.alpha*180/pi,model.Fy,'k')
grid
xlabel('side slip angle \alpha [deg.]')
ylabel('lateral tyre force Fy [N]')
legend('measurement','Magic Formula',2)
