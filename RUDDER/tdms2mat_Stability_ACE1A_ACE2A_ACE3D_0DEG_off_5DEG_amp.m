% Data conversion Elevator TS1
clear all
stability_ACE1A_ACE2A_ACE3D_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_1ACT_2ACT_FBI_1+0_5DEG_SURFACE_AT_0DEG_2021_22_7_15_42_21.tdms');
save('stability_ACE1A_ACE2A_ACE3D_0DEG_off_5DEG_amp.mat','stability_ACE1A_ACE2A_ACE3D_0DEG_off_5DEG_amp');