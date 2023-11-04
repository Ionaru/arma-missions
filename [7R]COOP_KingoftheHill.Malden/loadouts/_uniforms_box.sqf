// this addaction ["Platoon Leader", "loadouts\nato_pl.sqf"];
// this addaction ["Platoon FAC", "loadouts\nato_p_fac.sqf"];
this addaction ["Platoon Engineer (Demo)", "loadouts\.sqf"];
this addaction ["Platoon Engineer (EOD)", "loadouts\nato_p_e_eod.sqf"];
this addaction ["Platoon Engineer (Fortification)", "loadouts\nato_p_e_fort.sqf"];
this addaction ["Platoon Engineer (Repair)", "loadouts\nato_p_e_rep.sqf"];
this addaction ["Platoon DMR", "loadouts\nato_p_dmr.sqf"];
this addaction ["Platoon AR", "loadouts\nato_p_ar.sqf"];
this addaction ["Platoon UAV", "loadouts\nato_p_uav.sqf"];
this addaction ["Platoon Medic", "loadouts\nato_p_medic.sqf"];
this addaction ["Squad Leader", "loadouts\nato_sl.sqf"];
this addaction ["Combat Medic", "loadouts\nato_medic.sqf"];
this addaction ["Operator Rifle", "loadouts\nato_o_r.sqf"];
this addaction ["Operator AR", "loadouts\nato_o_ar.sqf"];
this addaction ["Operator Light AT", "loadouts\nato_o_lat.sqf"];
this addaction ["Operator MMG", "loadouts\nato_o_mmg.sqf"];
this addaction ["Operator Asst. MMG", "loadouts\nato_o_mmg_ab.sqf"];
this addaction ["Operator Medium AT", "loadouts\nato_o_mat.sqf"];
this addaction ["Operator Asst. Medium AT", "loadouts\nato_o_mat_ab.sqf"];
this addaction ["Operator Grenadier", "loadouts\nato_o_g.sqf"];
this addaction ["Operator DMR", "loadouts\nato_o_dmr.sqf"];
this addaction ["Operator Battlerifle", "loadouts\nato_o_br.sqf"];
this addaction ["Operator Specialist", "loadouts\nato_o_spc.sqf"];
this addaction ["Operator Breacher", "loadouts\nato_o_breacher.sqf"];
this addaction ["Operator Engineer (Demo)", "loadouts\nato_o_e_demo.sqf"];
this addaction ["Operator Engineer (EOD)", "loadouts\nato_o_e_eod.sqf"];
this addaction ["Operator Engineer (Fortification)", "loadouts\nato_o_e_fort.sqf"];
this addaction ["Operator Engineer (Repair)", "loadouts\nato_o_e_rep.sqf"];
this addaction ["Echo Rifleman", "loadouts\nato_e_r.sqf"];
this addaction ["Echo AR", "loadouts\nato_e_ar.sqf"];
this addaction ["Echo Engineer (Demo)", "loadouts\nato_e_e_demo.sqf"];
this addaction ["Echo Engineer (EOD)", "loadouts\nato_e_e_eod.sqf"];
this addaction ["Echo Engineer (Fortification)", "loadouts\nato_e_e_fort.sqf"];
this addaction ["Echo Engineer (Repair)", "loadouts\nato_e_e_rep.sqf"];
this addaction ["Echo Heavy Weapons (HAT)", "loadouts\nato_e_hat.sqf"];
this addaction ["Echo Asst. Heavy Weapons (HAT)", "loadouts\nato_e_hat_ab.sqf"];
this addaction ["Fox Commander", "loadouts\nato_f_com.sqf"];
this addaction ["Fox Crewman", "loadouts\nato_f_crew.sqf"];
this addaction ["Fox Technician", "loadouts\nato_f_tech.sqf"];
this addaction ["Sierra Spotter", "loadouts\nato_s_spotter.sqf"];
this addaction ["Sierra Sniper", "loadouts\nato_s_sniper.sqf"];
this addaction ["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"];
this addaction ["<t color=""#0000FF"">" +"Save Loadout", {(_this select 1) setVariable ["SR_Loadout",getUnitLoadout (_this select 1)];}];
this addaction ["<t color=""#0000FF"">" +"Load Loadout", {(_this select 1)  setUnitLoadout ((_this select 1)  getVariable ["SR_Loadout",[]]);}];


_loadouts = [
    ["Platoon", "#ffff00", "\A3\ui_f\data\map\markers\nato\b_hq.paa", [
        ["Platoon Leader", "loadouts\nato_pl.sqf"],
        ["Platoon FAC", "loadouts\nato_p_fac.sqf"],
        ["Platoon Engineer (Demo)", "loadouts\nato_p_e_demo.sqf"],
        ["Platoon Engineer (EOD)", "loadouts\nato_p_e_eod.sqf"],
        ["Platoon Engineer (Fortification)", "loadouts\nato_p_e_fort.sqf"],
        ["Platoon Engineer (Repair)", "loadouts\nato_p_e_rep.sqf"],
        ["Platoon DMR", "loadouts\nato_p_dmr.sqf"],
        ["Platoon Driver", "loadouts\nato_p_d.sqf"],
        ["Platoon AR", "loadouts\nato_p_ar.sqf"],
        ["Platoon Medic", "loadouts\nato_p_medic.sqf"]
    ]],
    ["Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_inf.paa", [
        ["Squad Leader", "loadouts\nato_sl.sqf"],
        ["Combat Medic", "loadouts\nato_medic.sqf"],
        ["Infantry Rifle", "loadouts\nato_o_r.sqf"],
        ["Infantry AR", "loadouts\nato_o_ar.sqf"],
        ["Infantry Light AT", "loadouts\nato_o_lat.sqf"],
        ["Infantry MMG", "loadouts\nato_o_mmg.sqf"],
        ["Infantry Asst. MMG", "loadouts\nato_o_mmg_ab.sqf"],
        ["Infantry Medium AT", "loadouts\nato_o_mat.sqf"],
        ["Infantry Asst. Medium AT", "loadouts\nato_o_mat_ab.sqf"]
    ]],
    ["Specialist Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", [
        ["Infantry Grenadier", "loadouts\nato_o_g.sqf"],
        ["Infantry DMR", "loadouts\nato_o_dmr.sqf"],
        ["Infantry Specialist", "loadouts\nato_o_spc.sqf"],
        ["Infantry Battlerifle", "loadouts\nato_o_br.sqf"],
        ["Infantry Breacher", "loadouts\nato_o_breacher.sqf"],
        ["Infantry Engineer (Demo)", "loadouts\nato_o_e_demo.sqf"],
        ["Infantry Engineer (EOD)", "loadouts\nato_o_e_eod.sqf"],
        ["Infantry Engineer (Fortification)", "loadouts\nato_o_e_fort.sqf"],
        ["Infantry Engineer (Repair)", "loadouts\nato_o_e_rep.sqf"]
    ]],
    ["Echo", "#ffa500", "\A3\ui_f\data\map\markers\nato\b_maint.paa", [
        ["Echo Rifleman", "loadouts\nato_e_r.sqf"],
        ["Echo AR", "loadouts\nato_e_ar.sqf"],
        ["Echo Engineer (Demo)", "loadouts\nato_e_e_demo.sqf"],
        ["Echo Engineer (EOD)", "loadouts\nato_e_e_eod.sqf"],
        ["Echo Engineer (Fortification)", "loadouts\nato_e_e_fort.sqf"],
        ["Echo Engineer (Repair)", "loadouts\nato_e_e_rep.sqf"],
        ["Echo Heavy Weapons (HAT)", "loadouts\nato_e_hat.sqf"],
        ["Echo Asst. Heavy Weapons (HAT)", "loadouts\nato_e_hat_ab.sqf"]
    ]],
    ["Recon", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_recon.paa", [
        ["Sierra Spotter", "loadouts\nato_s_spotter.sqf"],
        ["Sierra Sniper", "loadouts\nato_s_sniper.sqf"]
    ]],
    ["Armor", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_armor.paa", [
        ["Foxtrot Commander", "loadouts\nato_f_com.sqf"],
        ["Foxtrot Crewman", "loadouts\nato_f_crew.sqf"],
        ["Foxtrot Technician", "loadouts\nato_f_tech.sqf"]
    ]],
    ["Air", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_air.paa", [
        ["Rodeo Pilot", "loadouts\pilot_rotary.sqf"],
        ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
    ]]
];

[this, _loadouts] call fw_fnc_addUniformsToBox;
