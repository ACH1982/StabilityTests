% Data extraction for ACE10A_ACE11D_0DEG_off_5DEG_amp
clear all
% Loading data
load('stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat');
% Extracting signals
dataGroupLength = length(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData);
for i = 1:dataGroupLength
    if contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'FBI_ACE10x_COMMAND');
        demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE10C_ACE10M_RAM_POS_CAN1');
        ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE11C_ACE11M_RAM_POS_CAN1');
        ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE10C_ACE10M_DP_CAN1');
        pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE11C_ACE11M_DP_CAN1');
        pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE10C_ACE10M_SERVO_CMD_C_CAN1');
        currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    elseif contains(stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Name,'ACE11C_ACE11M_SERVO_CMD_C_CAN1');
        currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.Data.MeasuredData(i).Data;
    end
end
% timeseries generation
timeStep = 0.008;
frameLength = length(demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp);
timeVector = 0:timeStep:timeStep*(frameLength-1);
demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp = timeseries(currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp,timeVector);
% Save relevant timeseries
save('timeStep.mat','timeStep');
save('demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','demand_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','ramPosACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','ramPosACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','pressureACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','pressureACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','currentACE10_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');
save('currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp.mat','currentACE11_stability_ACE10A_ACE11D_0DEG_off_5DEG_amp');


