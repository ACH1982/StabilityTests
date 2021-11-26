% Data conversion Elevator TS1
clear all
stability_ACE10A_ACE11A_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_10ACT_11ACT_FBI_1+0_5DEG_SURFACE_AT_0DEG_2021_21_7_19_09_40.tdms');
save('stability_ACE10A_ACE11A_0DEG_off_5DEG_amp.mat','stability_ACE10A_ACE11A_0DEG_off_5DEG_amp');