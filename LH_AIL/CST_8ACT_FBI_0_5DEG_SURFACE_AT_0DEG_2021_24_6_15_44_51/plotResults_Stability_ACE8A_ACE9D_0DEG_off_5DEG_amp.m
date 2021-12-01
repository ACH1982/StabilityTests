clear all
% load data
load('demand_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('ramPosACE8_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('ramPosACE9_stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('transfer_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE8A_ACE9D_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
mag_8A_9D = abs(transferOL(rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp));
phase_8A_9D = angle(transferOL(rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp))*180/pi;
[GM_8A_9D,PM_8A_9D,freqGM_8A_9D,freqPM_8A_9D] = margin(mag_8A_9D,phase_8A_9D,...
    freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp(rangefreq_ACE8A_ACE9D_0DEG_off_5DEG_amp));
minFreq = 0.5; 
window = 1024;
stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*max(freqGM_8A_9D,freqPM_8A_9D)*0.5/62.5)+1);
margin(mag_8A_9D(stabRangeFreq),phase_8A_9D(stabRangeFreq),freqDemandRam_ACE8A_ACE9D_0DEG_off_5DEG_amp(stabRangeFreq)*2*pi);

