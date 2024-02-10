clear
clc
close all

x0 = [6378100;0;0]; % initial position/condition for position integrator.
% Initial Euler angles: various cases for problem 2 b
roll = 0.1; % P
pitch = 0.6; % Q
yaw = 0; % R

lat0 = 0;
lon0 = 0;

% Define Initial DCM for Poisson's Kinematical Equations

C1 = [cos(yaw) sin(yaw) 0; -sin(yaw) cos(yaw) 0;0 0 1];
C2 = [cos(pitch) 0 -sin(pitch); 0 1 0; sin(pitch) 0 cos(pitch)];
C3 = [1 0 0; 0 cos(roll) sin(roll); 0 -sin(roll) cos(roll)];

% Convert DCM
Cnb0 = C3 * C2 * C1; % initial DCM for Omega matrix 
disp(Cnb0);

% Initial quaternion 
q0 = angle2quat(yaw,pitch,roll);
