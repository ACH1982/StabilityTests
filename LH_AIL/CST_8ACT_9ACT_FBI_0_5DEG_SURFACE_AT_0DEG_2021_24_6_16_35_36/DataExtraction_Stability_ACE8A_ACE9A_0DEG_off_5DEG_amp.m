% Data extraction for ACE8A_ACE9A_0DEG_off_5DEG_amp
clear all
% Loading data
load('stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat');
% Extracting signals
dataGroupLength = length(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData);
for i = 1:dataGroupLength
    if contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'FBI_ACE8x_COMMAND');
        demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE8C_ACE8M_RAM_POS_CAN1');
        ramPosACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE9C_ACE9M_RAM_POS_CAN1');
        ramPosACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE8C_ACE8M_DP_CAN1');
        pressureACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE9C_ACE9M_DP_CAN1');
        pressureACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE8C_ACE8M_SERVO_CMD_C_CAN1');
        currentACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE9C_ACE9M_SERVO_CMD_C_CAN1');
        currentACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    end
end
% timeseries generation
timeStep = 0.008;
frameLength = length(demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp);
timeVector = 0:timeStep:timeStep*(frameLength-1);
demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
ramPosACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(ramPosACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
ramPosACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(ramPosACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
pressureACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(pressureACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
pressureACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(pressureACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
currentACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(currentACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
currentACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp = timeseries(currentACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp,timeVector);
% Save relevant timeseries
save('timeStep.mat','timeStep');
save('demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','demand_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('ramPosACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','ramPosACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('ramPosACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','ramPosACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('pressureACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','pressureACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('pressureACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','pressureACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('currentACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','currentACE8_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');
save('currentACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp.mat','currentACE9_stability_ACE8A_ACE9A_0DEG_off_5DEG_amp');


