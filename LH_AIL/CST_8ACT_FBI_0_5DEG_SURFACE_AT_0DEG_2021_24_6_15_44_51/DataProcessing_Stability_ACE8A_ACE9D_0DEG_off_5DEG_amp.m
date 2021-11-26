% Data processing for ACE8A_ACE9D_0DEG_off_5DEG_amp
clear all
% Loading data
load('timeStep.mat');
load('demand_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('ramPosACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('ramPosACE9_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('pressureACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('pressureACE9_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('currentACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('currentACE9_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
% % TF estimation
% responseACE8 = iddata(ramPosACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,demand_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,timeStep);
% responseACE9 = iddata(ramPosACE9_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,demand_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,timeStep);
% sysACE8_stab_ACE8A_ACE9D_0DEG_off_5DEG_amp = tfest(responseACE8,3);
% sysACE9_stab_ACE8A_ACE9D_0DEG_off_5DEG_amp = tfest(responseACE8,3);
% Response estimation
window = 1024;
maxFreq = 15;
minFreq = 0.5;
rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp = (round(window*minFreq*0.5/62.5)+1):(round(window*maxFreq*0.5/62.5)+1);
[transfer_ACE8A_ACE9D_0DEG_off_5DEG_amp,freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp]= tfestimate(demand_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,...
    ramPosACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.data,window,[],[],125);
save('rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat','rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp');
save('freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat','freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp');
save('transfer_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat','transfer_ACE8A_ACE9D_0DEG_off_5DEG_amp');