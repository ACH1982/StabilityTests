% Data extraction for ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp
clear all
% Loading data
load('stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat');
% Extracting signals
dataGroupLength = length(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData);
for i = 1:dataGroupLength
    if contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'FBI_ACEHx_COMMAND');
        demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEHC_ACEHM_RAM_POS_CAN1');
        ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEIC_ACEIM_RAM_POS_CAN1');
        ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACELC_ACELM_RAM_POS_CAN1');
        ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEHC_ACEHM_DP_CAN1');
        pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEIC_ACEIM_DP_CAN1');
        pressureACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACELC_ACELM_DP_CAN1');
        pressureACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEHC_ACEHM_SERVO_CMD_C_CAN1');
        currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACEIC_ACEIM_SERVO_CMD_C_CAN1');
        currentACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACELC_ACELM_SERVO_CMD_C_CAN1');
        currentACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    end
end
% timeseries generation
timeStep = 0.008;
frameLength = length(demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp);
timeVector = 0:timeStep:timeStep*(frameLength-1);
demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
pressureACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(pressureACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
pressureACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(pressureACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
currentACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(currentACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
currentACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp = timeseries(currentACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp,timeVector);
% Save relevant timeseries
save('timeStep.mat','timeStep');
save('demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','demand_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','ramPosACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','ramPosACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','ramPosACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');

save('pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','pressureACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('pressureACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','pressureACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('pressureACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','pressureACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');

save('currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','currentACE1_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('currentACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','currentACE2_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');
save('currentACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp.mat','currentACE3_stability_ACE1A_ACE2A_ACE3A_0DEG_off_5DEG_amp');


