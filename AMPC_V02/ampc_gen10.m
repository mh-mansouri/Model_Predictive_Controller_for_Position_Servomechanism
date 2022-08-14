%% create MPC controller object with sample time
mpc1 = mpc(plantd, 0.1);
%% specify prediction horizon
mpc1.PredictionHorizon = 40;
%% specify control horizon
mpc1.ControlHorizon = 2;
%% specify nominal values for inputs and outputs
mpc1.Model.Nominal.U = 0;
mpc1.Model.Nominal.Y = [0;0];
%% specify constraints for MV and MV Rate
mpc1.MV(1).Min = -220;
mpc1.MV(1).Max = 220;
%% specify constraints for OV
mpc1.OV(2).Min = -78.5;
mpc1.OV(2).Max = 78.5;
%% specify overall adjustment factor applied to weights
beta = 4.7588;
%% specify weights
mpc1.Weights.MV = 0*beta;
mpc1.Weights.MVRate = 0.1/beta;
mpc1.Weights.OV = [1 0]*beta;
mpc1.Weights.ECR = 100000;

