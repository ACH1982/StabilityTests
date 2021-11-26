% Data extraction for ACE4A_ACE5D_0DEG_off_5DEG_amp
clear all
% Loading data
load('stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat');
% Extracting signals
dataGroupLength = length(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData);
for i = 1:dataGroupLength
    if contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'FBI_ACE1Lx_COMMAND');
        demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1LC_ACE1LM_RAM_POS_CAN1');
        ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2LC_ACE2LM_RAM_POS_CAN1');
        ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1LC_ACE1LM_DP_CAN1');
        pressureACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2LC_ACE2LM_DP_CAN1');
        pressureACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1LC_ACE1LM_SERVO_CMD_C_CAN1');
        currentACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2LC_ACE2LM_SERVO_CMD_C_CAN1');
        currentACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    end
end
% timeseries generation
timeStep = 0.008;
frameLength = length(demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp);
timeVector = 0:timeStep:timeStep*(frameLength-1);
demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
pressureACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(pressureACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
pressureACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(pressureACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
currentACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(currentACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
currentACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp = timeseries(currentACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp,timeVector);
% Save relevant timeseries
save('timeStep.mat','timeStep');
save('demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','demand_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','ramPosACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','ramPosACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('pressureACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','pressureACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('pressureACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','pressureACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('currentACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','currentACE4_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');
save('currentACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp.mat','currentACE5_stability_ACE4A_ACE5D_0DEG_off_5DEG_amp');


