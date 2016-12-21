clear all
close all

disp(' ')
disp('in the data files units are always SI (N,kg,m,rad)!')
disp('abbreviations:')
disp(' ds      : delta steering wheel, steering wheel angle')
disp(' V or vx : forward velocity')
disp(' beta    : vehicle side slip angle')
disp(' r       : yaw velocity')
disp(' ay      : lateral acceleration')
disp(' left/right denotes a left or right turn')


% steady state cornering ---------------------------------------------
load steady_state_circular_loaded.mat

plot(V_left*3.6,-ds_left*180/pi,'x',V_right*3.6,ds_right*180/pi,'o')
xlabel('velocity [km/h]');
ylabel('steering wheel angle [deg]')
legend('left','right',2)
grid

figure
plot(-ay_left,-ds_left*180/pi,'x',ay_right,ds_right*180/pi,'o')
xlabel('lateral acceleration [m/s2]');
ylabel('steering wheel angle [deg]')
legend('left','right',2)
grid

figure
plot(-ay_left,-beta_left*180/pi,'x',ay_right,beta_right*180/pi,'o')
xlabel('lateral acceleration [m/s2]');
ylabel('vehicle side slip angle \beta [deg]')
legend('left','right',2)
grid

% ... add the yaw velocity gain plot here!


% random steering ----------------------------------------------------
load pseudo_random_loaded.mat

figure
subplot(3,1,1)
loglog(freq,abs(T_ayds)*pi/180)
title('lateral acceleration response to steering wheel angle')
ylabel('magnitude [m/s2 /deg.]')
grid
subplot(3,1,2)
semilogx(freq,angle(T_ayds)*180/pi)
ylabel('phase')
grid
subplot(3,1,3)
semilogx(freq,C_ayds)
xlabel('frequency [Hz]')
ylabel('coherence')
grid


figure
subplot(3,1,1)
loglog(freq,abs(T_rds))
title('yaw velocity response to steering wheel angle')
ylabel('magnitude [1/s]')
grid
subplot(3,1,2)
semilogx(freq,angle(T_rds)*180/pi)
ylabel('phase')
grid
subplot(3,1,3)
semilogx(freq,C_rds)
xlabel('frequency [Hz]')
ylabel('coherence')
grid


% J-turn (stepsteer)--------------------------------------------------
load Jturn_loaded

figure
subplot(4,1,1)
plot(time,ds*180/pi)
ylabel('\delta_s [deg]')
title('Jturn')
grid
subplot(4,1,2)
plot(time,vx*3.6)
ylabel('vx [km/h]')
grid
subplot(4,1,3)
plot(time,ay)
ylabel('ay [m/s2]')
grid
subplot(4,1,4)
plot(time,r*180/pi)
xlabel('time [s]')
ylabel('yaw vel [deg/s]')
grid


% double lane change -------------------------------------------------
load lane_change_loaded

figure
subplot(4,1,1)
plot(time,ds*180/pi)
ylabel('\delta_s [deg]')
title('Double lane change')
grid
subplot(4,1,2)
plot(time,vx*3.6)
ylabel('vx [km/h]')
grid
subplot(4,1,3)
plot(time,ay)
ylabel('ay [m/s2]')
grid
subplot(4,1,4)
plot(time,r*180/pi)
xlabel('time [s]')
ylabel('yaw vel [deg/s]')
grid
