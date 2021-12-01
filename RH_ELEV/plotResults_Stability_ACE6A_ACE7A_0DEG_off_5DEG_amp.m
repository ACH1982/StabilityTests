clear all
% load data
load('demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('transfer_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE6A_ACE7A_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE6A_ACE7A_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
mag_6A_7A = abs(transferOL(rangefreq_ACE6A_ACE7A_0DEG_off_5DEG_amp));
phase_6A_7A = angle(transferOL(rangefreq_ACE6A_ACE7A_0DEG_off_5DEG_amp))*180/pi;
[GM_6A_7A,PM_6A_7A,freqGM_6A_7A,freqPM_6A_7A] = margin(mag_6A_7A,phase_6A_7A,...
    freqDemandRam_ACE6A_ACE7A_0DEG_off_5DEG_amp(rangefreq_ACE6A_ACE7A_0DEG_off_5DEG_amp));
minFreq = 0.5; 
window = 1024;
stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*max(freqGM_6A_7A,freqPM_6A_7A)*0.5/62.5)+1);
margin(mag_6A_7A(stabRangeFreq),phase_6A_7A(stabRangeFreq),freqDemandRam_ACE6A_ACE7A_0DEG_off_5DEG_amp(stabRangeFreq)*2*pi);
