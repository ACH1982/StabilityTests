% Data conversion Elevator TS1
clear all
stability_ACE6A_ACE7A_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_ATL_CST_ACE6_ACE7_ACT_RVDT_0_3DEG_SURFACE_AT_0DEG_2021_22_7_11_59_03.tdms');
save('stability_ACE6A_ACE7A_0DEG_off_5DEG_amp.mat','stability_ACE6A_ACE7A_0DEG_off_5DEG_amp');