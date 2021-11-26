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
% yyaxis right
% semilogx(freqDemandRamACE10_ACE10A_0DEG_off_5DEG_amp(rangefreq_ACE10A_0DEG_off_5DEG_amp),...
%     20*log10(abs(transferOL(rangefreq_ACE10A_0DEG_off_5DEG_amp))))
% yyaxis left
% semilogx(freqDemandRamACE10_ACE10A_0DEG_off_5DEG_amp(rangefreq_ACE10A_0DEG_off_5DEG_amp),...
%      angle(transferOL(rangefreq_ACE10A_0DEG_off_5DEG_amp))*180/pi),grid
mag = abs(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp));
phase = angle(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp))*180/pi;
subplot(1,2,1)
margin(mag,phase,freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp)*2*pi);
subplot(1,2,2)
yyaxis right
semilogx(freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp),...
    20*log10(abs(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp))))
yyaxis left
semilogx(freqDemandRam_ACE10A_ACE11A_0DEG_off_5DEG_amp(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp),...
     angle(transferOL(rangefreq_ACE10A_ACE11A_0DEG_off_5DEG_amp))*180/pi),grid