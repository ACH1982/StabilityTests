% Data extraction for ACE6A_ACE7A_0DEG_off_5DEG_amp
clear all
% Loading data
load('stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat');
% Extracting signals
dataGroupLength = length(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData);
for i = 1:dataGroupLength
    if contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'FBI_ACE1Rx_COMMAND');
        demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1RC_ACE1RM_RAM_POS_CAN1');
        ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2RC_ACE2RM_RAM_POS_CAN1');
        ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1RC_ACE1RM_DP_CAN1');
        pressureACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2RC_ACE2RM_DP_CAN1');
        pressureACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE1RC_ACE1RM_SERVO_CMD_C_CAN1');
        currentACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE2RC_ACE2RM_SERVO_CMD_C_CAN1');
        currentACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    end
end
% timeseries generation
timeStep = 0.008;
frameLength = length(demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp);
timeVector = 0:timeStep:timeStep*(frameLength-1);
demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
pressureACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(pressureACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
pressureACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(pressureACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
currentACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(currentACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
currentACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = timeseries(currentACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp,timeVector);
% Save relevant timeseries
save('timeStep.mat','timeStep');
save('demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','demand_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','ramPosACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','ramPosACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('pressureACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','pressureACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('pressureACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','pressureACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('currentACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','currentACE6_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');
save('currentACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','currentACE7_stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');


