clear all
% load data
load('demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('transfer_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE4A_ACE5D_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE4A_ACE5D_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
mag_4A_5D = abs(transferOL(rangefreq_ACE4A_ACE5D_0DEG_off_5DEG_amp));
phase_4A_5D = angle(transferOL(rangefreq_ACE4A_ACE5D_0DEG_off_5DEG_amp))*180/pi;
[GM_4A_5D,PM_4A_5D,freqGM_4A_5D,freqPM_4A_5D] = margin(mag_4A_5D,phase_4A_5D,...
    freqDemandRam_ACE4A_ACE5D_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5D_0DEG_off_5DEG_amp));
minFreq = 0.5; 
window = 1024;
stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*max(freqGM_4A_5D,freqPM_4A_5D)*0.5/62.5)+1);
margin(mag_4A_5D(stabRangeFreq),phase_4A_5D(stabRangeFreq),freqDemandRam_ACE4A_ACE5D_0DEG_off_5DEG_amp(stabRangeFreq)*2*pi);
 
