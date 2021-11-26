% Data processing for ACE4A_ACE5A_0DEG_off_5DEG_amp
clear all
% Loading data
load('timeStep.mat');
load('demand_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('ramPosACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('ramPosACE5_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('pressureACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('pressureACE5_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('currentACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('currentACE5_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
% % TF estimation
% responseACE4 = iddata(ramPosACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,demand_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,timeStep);
% responseACE5 = iddata(ramPosACE5_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,demand_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,timeStep);
% sysACE4_stab_ACE4A_ACE5A_0DEG_off_5DEG_amp = tfest(responseACE4,3);
% sysACE5_stab_ACE4A_ACE5A_0DEG_off_5DEG_amp = tfest(responseACE4,3);
% Response estimation
window = 1024;
maxFreq = 25;
minFreq = 0.5;
rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp = (round(window*minFreq*0.5/62.5)+1):(round(window*maxFreq*0.5/62.5)+1);
[transfer_ACE4A_ACE5A_0DEG_off_5DEG_amp,freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp]= tfestimate(demand_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,...
    ramPosACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.data,window,[],[],125);
save('rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat','rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp');
save('freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat','freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp');
save('transfer_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat','transfer_ACE4A_ACE5A_0DEG_off_5DEG_amp');