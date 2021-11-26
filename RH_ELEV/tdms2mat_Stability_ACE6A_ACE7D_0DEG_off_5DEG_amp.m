% Data conversion Elevator TS1
clear all
stability_ACE6A_ACE7D_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_6ACT_FBI_1+0_5DEG_SURFACE_AT_0DEG_2021_22_7_10_54_22.tdms');
save('stability_ACE6A_ACE7D_0DEG_off_5DEG_amp.mat','stability_ACE6A_ACE7D_0DEG_off_5DEG_amp');