clear all
% load data
load('demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('transfer_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
mag_1A_2A_3A = abs(transferOL(rangefreq_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp));
phase_1A_2A_3A = angle(transferOL(rangefreq_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp))*180/pi;
[GM_1A_2A_3A,PM_1A_2A_3A,freqGM_1A_2A_3A,freqPM_1A_2A_3A] = margin(mag_1A_2A_3A,phase_1A_2A_3A,...
    freqDemandRam_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp(rangefreq_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp));
minFreq = 0.5; 
window = 1024;
%stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*max(freqGM_1A_2A_3A,freqPM_1A_2A_3A)*0.5/62.5)+1);
stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*20*0.5/62.5)+1);
margin(mag_1A_2A_3A(stabRangeFreq),phase_1A_2A_3A(stabRangeFreq),freqDemandRam_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp(stabRangeFreq)*2*pi);
