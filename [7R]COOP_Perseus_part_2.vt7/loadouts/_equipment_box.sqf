this addaction ["<t color=""#00FF00"">" +"C-More", "7R\Loadouts\7R_EQ.sqf",["optic_Aco"]];
this addaction ["<t color=""#00FF00"">" +"M552", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_552"]];
this addaction ["<t color=""#00FF00"">" +"M68 CCO", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_compm4"]];
this addaction ["<t color=""#00FF00"">" +"MRDS", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_mrds"]];
this addaction ["<t color=""#00FF00"">" +"RM05", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RM05"]];
this addaction ["<t color=""#00FF00"">" +"RX01", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_RX01"]];
this addaction ["<t color=""#00FF00"">" +"XPS3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_eotech_xps3"]];

// this addaction ["<t color=""#00FF00"">" +"Rakurs PM", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_rakursPM"]];
// this addaction ["<t color=""#00FF00"">" +"1P87", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_1p87"]];
// this addaction ["<t color=""#00FF00"">" +"EKP-8-18", "7R\Loadouts\7R_EQ.sqf",["rhs_acc_ekp8_18"]];

this addaction ["<t color=""#FF8C00"">" +"ACOG3", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG3_USMC"]];
this addaction ["<t color=""#FF8C00"">" +"ACOG3 RMR", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_RMR"]];
this addaction ["<t color=""#FF8C00"">" +"AR/MMG sight - M145", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ELCAN"]];
this addaction ["<t color=""#FF0000"">" +"DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_mrds"]];
this addaction ["<t color=""#0000FF"">" +"x4 Night sight - ACOG", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_ACOG_anpvs27"]];
this addaction ["<t color=""#0000FF"">" +"x8 Night sight - DMR Sight", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_premier_anpvs27"]];

this addaction ["<t color=""#ffff00"">" +"Suppressor - 5.56mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_rotex5_grey"]];
this addaction ["<t color=""#ffff00"">" +"Suppressor - 7.62mm", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_aac_762sd_silencer"]];
this addaction ["<t color=""#ffff00"">" +"Suppressor - Mk 11", "7R\Loadouts\7R_EQ.sqf",["rhsusf_acc_SR25S"]];

// Support items
[this, 2] call fw_fnc_addEquipmentItems;

// Radios
[this] call fw_fnc_addEquipmentRadios;
