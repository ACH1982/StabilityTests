% Data processing for ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp
clear all
% Loading data
load('timeStep.mat');
load('demand_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('ramPosACE1_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('ramPosACE2_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('ramPosACE3_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');

load('pressureACE1_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('pressureACE2_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('pressureACE3_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');

load('currentACE1_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('currentACE2_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
load('currentACE3_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat');
% % TF estimation
% responseACE6 = iddata(ramPosACE6_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,demand_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,timeStep);
% responseACE7 = iddata(ramPosACE7_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,demand_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,timeStep);
% sysACE6_stab_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp = tfest(responseACE6,3);
% sysACE7_stab_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp = tfest(responseACE6,3);
% Response estimation
window = 1024;
maxFreq = 25;
minFreq = 0.5;
rangefreq_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp = (round(window*minFreq*0.5/62.5)+1):(round(window*maxFreq*0.5/62.5)+1);
[transfer_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp,freqDemandRam_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp]= tfestimate(demand_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,...
    ramPosACE1_stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.data,window,[],[],125);
save('rangefreq_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat','rangefreq_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp');
save('freqDemandRam_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat','freqDemandRam_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp');
save('transfer_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat','transfer_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp');