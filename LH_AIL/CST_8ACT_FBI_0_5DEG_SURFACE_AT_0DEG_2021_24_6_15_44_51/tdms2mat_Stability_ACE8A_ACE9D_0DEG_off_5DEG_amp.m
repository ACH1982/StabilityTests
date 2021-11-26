% Data conversion Elevator TS1
clear all
stability_ACE8A_ACE9D_0DEG_off_5DEG_amp = convertTDMS(false,...
    'PRCS_SHORTENED_PRCS_ATL_CST_8ACT_FBI_0_5DEG_SURFACE_AT_0DEG_2021_24_6_15_44_51.tdms');
save('stability_ACE8A_ACE9D_0DEG_off_5DEG_amp.mat','stability_ACE8A_ACE9D_0DEG_off_5DEG_amp');