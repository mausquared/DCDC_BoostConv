clc
clear
%% Constants
%Inductor of inductor: 533 uh
%Resistance of inductor: 350 - 400 mili ohm
%% calcultion design example
Vin = 30;
Vo = 60;
Fsw = 40000;
Ro = 12;
delta_vo = 0.04*Vo; %want the output voltage to not be more than a change of 2% (2% up or down)  

D = 1 - (Vin / Vo);
%I_L = Vo^2 / (Ro*Vin); % note that I_L is the same as I_in
delta_il = 0.15*5; % ripple in inductor is limited to 20% of average inductor current
L = (Vin*D) / (delta_il * Fsw); % inductor value 
C = (Vin*D) / (delta_vo*(1-D)*Ro*Fsw);
C1 = delta_il / (8*Fsw*delta_vo) 
disp(C)
disp(L)
%% Calculation of coil (EFD 30/15/9) 
u_r = 246; %this is for gap equal to 0.27mm
turns = 40; % checked for multiple values of N, this should be correct 
area = 6.9e-5; %Ae = 69mm^2
length = 0.068; %length = 68mm
u = 1.26e-6; % this is constant 

L_coil_EFD30 = (u_r * turns^2 * area * u) / length;
disp(L_coil_EFD30)

%% Calculation of coil (EFD 34/17/11)
u_r = 310; %this is for gap equal to 0.20mm (smallest gap) 
turns = 33 ; % checked for multiple values of N, this should be correct 
area = 9.71e-5; %Ae = 97.1mm^2
length = 0.0786; %length = 78.6mm

L_coil_EFD34 = (u_r * turns^2 * area * u) / length;
disp(L_coil_EFD34)

%% Calculation of coil (EFD 39/20/13)
u_r = 374; %this is for gap equal to 0.20mm (smallest gap)
turns = 27 ; % checked for multiple values of N, this should be correct 
area = 0.000125; %Ae = 127mm^2
length = 0.0922; %length = 92.2mm
length_wire = 0.74 * turns / 1000; 

L_coil_EFD39 = (u_r * turns^2 * area * u) / length;
disp(L_coil_EFD39)


%% Calculation for wire thickness
% use EFD 30/13/9 magnetics circuit 
Diameter = area / pi;
% Use AWG 16 of copper table 
T = 0.0139;
Wl = pi*(Diameter+T/2)*(length/T)*turns;
disp(Wl)


