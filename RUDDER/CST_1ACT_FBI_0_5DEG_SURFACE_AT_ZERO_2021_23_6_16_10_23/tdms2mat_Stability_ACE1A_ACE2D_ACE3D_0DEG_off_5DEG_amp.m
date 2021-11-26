% Data conversion Elevator TS1
clear all
stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_1ACT_FBI_0_5DEG_SURFACE_AT_ZERO_2021_23_6_16_10_23.tdms');
save('stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp.mat','stability_ACE1A_ACE2D_ACE3D_0DEG_off_5DEG_amp');