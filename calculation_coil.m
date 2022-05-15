%% Calculation of inductance
Vd = 30;
D = 0.5;
Fs = 10000;
Delta_il = 8.6;
L1 = (Vd*D) / (Fs * Delta_il);
disp(L1)
%% Calculation of coil 
% maximum L = 3.75e-4, Lmin = 1.74e-4
u_r = 1560;
turns = 14;
area = 58e-6;
length = 0.057;
u = 1.26e-6;

L_coil = (u_r * turns^2 * area * u) / length
disp(L_coil)
%% Calculation for wire thickness
% use EFD 25/13/9 magnetics circuit 
D = area / pi;
% Use AWG 17 of copper table 
T = 0.124;


Wl = pi*(D+T/2)*(length/T)*turns;
disp(Wl)


