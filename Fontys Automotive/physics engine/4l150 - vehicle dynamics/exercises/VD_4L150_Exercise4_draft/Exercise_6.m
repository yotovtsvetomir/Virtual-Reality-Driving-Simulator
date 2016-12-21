clc
clear
close all
savedir = 'D:\Documents\dropbox\TUe\Master\Quartile_2\4L150 - Vehicle Dynamics\Report\Graphics\';
Linewidth = 1.5;

% initial conditions 
u0 = 20;
v0 = 0;
r0 = 0;
w0 = u0/0.3;

% simuation parameters
t_end = 10;

simulation_number = input('simulation number:\n');
switch simulation_number
    case 1
        steer_input = input('steering input (0.02 or 0.1):\n');
        brake = 0;
        drive_front = 0;
        drive_rear = 0;
    case 2
        steer_input = 0.02;
        brake = 1500;
        drive_front = 0;
        drive_rear = 0;
    case 3
        steer_input = 0.02;
        brake = 0;
        drive_front = 0;
        drive_rear = input('drive torque (1000 or 3000):\n');
    case 4
        steer_input = 0.02;
        brake = 0;
        drive_front = input('drive torque (1000 or 3000):\n');
        drive_rear = 0;
end

% simulate model
sim('vehicle_model_skeleton');

% post processing
% alpha
plot(tout,alpha_front*180/pi,tout,alpha_rear*180/pi,'Linewidth',Linewidth); 
xlabel('time [s]')
ylabel('slip angle \alpha [deg]')
legend('front','rear')
grid

savename = ['Ex6_alpha_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close

% longitudinal slip
plot(tout,kappa_front,tout,kappa_rear,'Linewidth',Linewidth); 
xlabel('time [s]')
ylabel('longitudinal slip \kappa [-]')
legend('front','rear')
grid

savename = ['Ex6_kappa_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close

% accelerations
plot(tout,ax,tout,ay,'Linewidth',Linewidth); 
xlabel('time [s]')
ylabel('acceleration [m/s^2]')
legend('longitudinal','lateral')
grid

savename = ['Ex6_acceleration_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close

% yawrate
plot(tout,r*180/pi,'Linewidth',Linewidth); 
xlabel('time [s]')
ylabel('yawrate [deg/s]')
grid

savename = ['Ex6_yawrate_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close

% vertical force
plot(tout,Fz1,tout,Fz2,'Linewidth',Linewidth);
xlabel('time [s]')
ylabel('vertical force [N]')
legend('front','rear')
grid

savename = ['Ex6_vertical_force_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close

% velocity
plot(tout,u,tout,v,'Linewidth',Linewidth);
xlabel('time [s]')
ylabel('velocity [m/s]')
legend('longitudinal','lateral')
grid

savename = ['Ex6_velocity_' num2str(simulation_number) '_' num2str(steer_input*100) ...
    '_' num2str(brake) '_' num2str(drive_front) '_' num2str(drive_rear)];
export_fig([savedir savename],'-pdf','-transparent','-painters');
close