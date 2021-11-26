% Data conversion Elevator TS1
clear all
stability_ACE4A_ACE5A_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_4ACT_5ACT_FBI_1+0_5DEG_SURFACE_AT_0DEG_2021_21_7_18_16_57.tdms');
save('stability_ACE4A_ACE5A_0DEG_off_5DEG_amp.mat','stability_ACE4A_ACE5A_0DEG_off_5DEG_amp');