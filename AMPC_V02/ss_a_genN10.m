clear all;
clc;

Kt = 1280.2;  % Torsional rigidity
Km = 10;      % Motor constant
Jm = 0.5;     % Motor inertia
Jl = 50*Jm;   % Load inertia
Bm = 0.1;     % Rotor viscous friction
Bl = 25;      % Load viscous friction
R = 20;       % Armature resistance

Tau = 78.5;   %Torque limits
Ts = 0.1;    %Default sampling time


N = 10;       % Gear ratio


A = [        0       1             0                0;
        -Kt/Jl  -Bl/Jl     Kt/(N*Jl)                0;
             0       0             0                1;
     Kt/(Jm*N)       0  -Kt/(Jm*N^2)  -(Bm+Km^2/R)/Jm];
B = [0; 0; 0; Km/(R*Jm)];
C = [  1  0       0  0;
      Kt  0   -Kt/N  0];
D = [0; 0];

plant = ss(A,B,C,D);
plant.InputName = 'Voltage';
plant.InputUnit = 'V';
plant.OutputName = {'ThetaL', 'Torque'};
plant.OutputUnit = {'rad','Nm'};
plantd = c2d(plant,0.1);
mpcDesigner(plantd);


