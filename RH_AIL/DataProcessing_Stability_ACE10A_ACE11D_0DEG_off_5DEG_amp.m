% Data processing for ACE10A_ACE11D_0DEG_off_5DEG_amp
clear all
% Loading data
load('timeStep.mat');
load('demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
load('currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
% % TF estimation
% responseACE10 = iddata(ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,timeStep);
% responseACE11 = iddata(ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,timeStep);
% sysACE10_stab_ACE10A_ACE11D_0DEG_off_5DEG_amp = tfest(responseACE10,3);
% sysACE11_stab_ACE10A_ACE11D_0DEG_off_5DEG_amp = tfest(responseACE10,3);
% Response estimation
window = 1024;
maxFreq = 15;
minFreq = 0.5;
rangefreq_ACE10A_ACE11D_0DEG_off_5DEG_amp = (round(window*minFreq*0.5/62.5)+1):(round(window*maxFreq*0.5/62.5)+1);
[transfer_ACE10A_ACE11D_0DEG_off_5DEG_amp,freqDemandRam_ACE10A_ACE11D_0DEG_off_5DEG_amp]= tfestimate(demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,...
    ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.data,window,[],[],125);
save('rangefreq_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','rangefreq_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('freqDemandRam_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','freqDemandRam_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('transfer_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','transfer_ACE10A_ACE11D_0DEG_off_5DEG_amp');