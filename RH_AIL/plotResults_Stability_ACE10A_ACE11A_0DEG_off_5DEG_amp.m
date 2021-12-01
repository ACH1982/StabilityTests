clear all
% load data
load('demand_stability_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('ramPosACE10_stability_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('ramPosACE11_stability_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('transfer_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE10A_ACE11A_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
mag_10A_11A = abs(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp));
phase_10A_11A = angle(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp))*180/pi;
[GM_10A_11A,PM_10A_11A,freqGM_10A_11A,freqPM_10A_11A] = margin(mag_10A_11A,phase_10A_11A,...
    freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp));
minFreq = 0.5; 
window = 1024;
stabRangeFreq = (round(window*minFreq*0.5/62.5)+1):(round(window*max(freqGM_10A_11A,freqPM_10A_11A)*0.5/62.5)+1);
margin(mag_10A_11A(stabRangeFreq),phase_10A_11A(stabRangeFreq),freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp(stabRangeFreq)*2*pi);

