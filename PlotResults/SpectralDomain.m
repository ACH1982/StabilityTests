clear all
% Load data
load('demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
load('pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
samplingFreq = 125;
timeLength = 129*125;
timeVector = 1:timeLength;
demand = demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.data(timeVector);
ramPos = ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.data(timeVector);
current = currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.data(timeVector);
pressure = pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.data(timeVector);
% Spectral power density for each signal
[pxxDemand_def,freqDemand_def] = pwelch(demand,[],[],[],125);
[pxxDemand_1024,freqDemand_1024] = pwelch(demand,1024,[],[],125);
[pxxDemand_4096,freqDemand_4096] = pwelch(demand,4*1024,[],[],125);
[pxxDemand_8192,freqDemand_8192] = pwelch(demand,8*1024,[],[],125);
% Spectrum
[demandSpectrum,freqDemand] = pspectrum(demand,125);
[ramPosSpectrum,freqRamPos] = pspectrum(ramPos,125);
% Fourier transform
demandSpectrumFFT = fft(demand);
P2 = abs(demandSpectrumFFT);
P1 = P2(1:floor(timeLength/2)+1);
P1(2:end) = 2*P1(2:end);
freq = (0:floor(timeLength/2))*samplingFreq/timeLength;
% Response 
freqSampling = 0.5:0.1:30;
[transfer,freqTransfer] = tfestimate(demand,ramPos,[],[],freqSampling,samplingFreq);
mag = abs(transfer);
phase = angle(transfer);
subplot(2,1,1)
plot(freqTransfer,20*log10(mag)),grid
subplot(2,1,2)
plot(freqTransfer,phase*180/pi),grid