this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"M552 WD", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552_wd"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint T1 high", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_T1_high"]];
this addaction ["<t color=""#00FF00"">" +"Aimpoint T1 low", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_T1_low"]];
this addaction ["<t color=""#00FF00"">" +"C-more", "7R\Loadouts\7R_EQ.sqf",["optic_Aco"]];
this addaction ["<t color=""#00FF00"">" +"RX01 no filter", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01_noFilter"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG WD", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_wd"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230"]];
this addaction ["<t color=""#FF8C00"">" +"SU-230 MRDS", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_su230_mrds"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - ACOG MDO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_MDO"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - MOS", "7R\Loadouts\7R_EQ.sqf",["optic_SOS"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight - PMII", "7R\Loadouts\7R_EQ.sqf",["RKSL_optic_PMII_312_wdl"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
