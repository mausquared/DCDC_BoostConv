clc
clear
%% calcultion design example
Vin = 30;
Vo = 60;
Fsw = 40000;
Ro = 10;
delta_vo = 0.04*Vo; 

D = 1 - (Vin / Vo);
%I_L = Vo^2 / (Ro*Vin); % note that I_L is the same as I_in
delta_il = 0.15*5; % ripple in inductor is limited to 20% of average inductor current
L = (Vin*D) / (delta_il * Fsw); % inductor value 
C = (Vin*D) / (delta_vo*(1-D)*Ro*Fsw);

disp(L)
%% Calculation of coil 
u_r = 246; %this is for gap equal to 0.27mm
turns = 40; % checked for multiple values of N, this should be correct 
area = 6.9e-5; %Ae = 69mm^2
length = 0.068; %length = 68mm
u = 1.26e-6; % this is constant 

L_coil = (u_r * turns^2 * area * u) / length;
disp(L_coil)

%% Calculation for wire thickness
% use EFD 25/13/9 magnetics circuit 
Diameter = area / pi;
% Use AWG 17 of copper table 
T = 0.124;


Wl = pi*(Diameter+T/2)*(length/T)*turns;
disp(Wl)


