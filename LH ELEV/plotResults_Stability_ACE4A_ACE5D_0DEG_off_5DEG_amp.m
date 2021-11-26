clear all
% load data
load('demand_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('ramPosACE4_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('ramPosACE5_stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('transfer_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat');
load('timeStep.mat','timeStep');
% Estimate the open loop transfer function
transferCL = transfer_ACE4A_ACE5A_0DEG_off_5DEG_amp;
for i=1:length(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp)
    transferOL(i) = transferCL(i)/(1-transferCL(i));
end
yyaxis right
semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
    20*log10(abs(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))))
yyaxis left
semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
     angle(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))*180/pi),grid
mag = abs(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp));
phase = angle(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))*180/pi;
subplot(1,2,1)
margin(mag,phase,freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp)*2*pi);
subplot(1,2,2)
yyaxis right
semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
    20*log10(abs(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))))
yyaxis left
semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
     angle(transferOL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))*180/pi),grid

 
% magCL = abs(transferCL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp));
% phaseCL = angle(transferCL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))*180/pi;
% subplot(1,2,1)
% margin(magCL,phaseCL,freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp)*2*pi);
% subplot(1,2,2)
% yyaxis right
% semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
%     20*log10(abs(transferCL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))))
% yyaxis left
% semilogx(freqDemandRam_ACE4A_ACE5A_0DEG_off_5DEG_amp(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp),...
%      angle(transferCL(rangefreq_ACE4A_ACE5A_0DEG_off_5DEG_amp))*180/pi),grid