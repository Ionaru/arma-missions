_loadouts = [
    ["Platoon", "#ffff00", "\A3\ui_f\data\map\markers\nato\b_hq.paa", [
        ["Platoon Leader", "loadouts\usmc_pl.sqf"],
        ["Platoon Engineer (Demo)", "loadouts\usmc_p_e_demo.sqf"],
        ["Platoon Engineer (EOD)", "loadouts\usmc_p_e_eod.sqf"],
        ["Platoon Engineer (Fortification)", "loadouts\usmc_p_e_fort.sqf"],
        ["Platoon Engineer (Repair)", "loadouts\usmc_p_e_rep.sqf"],
        ["Platoon DMR", "loadouts\usmc_p_dmr.sqf"],
        ["Platoon Driver", "loadouts\usmc_p_d.sqf"],
        ["Platoon AR", "loadouts\usmc_p_ar.sqf"],
        ["Platoon Medic", "loadouts\usmc_p_medic.sqf"]
    ]],
    ["Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_inf.paa", [
        ["Squad Leader", "loadouts\usmc_sl.sqf"],
        ["Infantry Rifle", "loadouts\usmc_o_r.sqf"],
        ["Infantry AR", "loadouts\usmc_o_ar.sqf"],
        ["Infantry Light AT", "loadouts\usmc_o_lat.sqf"],
        ["Infantry MMG", "loadouts\usmc_o_mmg.sqf"],
        ["Infantry Asst. MMG", "loadouts\usmc_o_mmg_ab.sqf"],
        ["Infantry Medium AT", "loadouts\usmc_o_mat.sqf"],
        ["Infantry Asst. Medium AT", "loadouts\usmc_o_mat_ab.sqf"],
        ["Combat Medic", "loadouts\usmc_medic.sqf"]
    ]],
    ["Specialist Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", [
        ["Infantry Grenadier", "loadouts\usmc_o_g.sqf"],
        ["Infantry DMR (5.56)", "loadouts\usmc_o_dmr.sqf"],
        ["Infantry Battlerifle (Mk 14)", "loadouts\usmc_o_br.sqf"],
        ["Infantry Specialist (M27)", "loadouts\usmc_o_spc.sqf"],
        ["Infantry Breacher", "loadouts\usmc_o_breacher.sqf"],
        ["Infantry Engineer (Demo)", "loadouts\usmc_o_e_demo.sqf"],
        ["Infantry Engineer (EOD)", "loadouts\usmc_o_e_eod.sqf"],
        ["Infantry Engineer (Fortification)", "loadouts\usmc_o_e_fort.sqf"],
        ["Infantry Engineer (Repair)", "loadouts\usmc_o_e_rep.sqf"]
    ]],
    ["Echo", "#ffa500", "\A3\ui_f\data\map\markers\nato\b_maint.paa", [
        ["Echo Rifleman", "loadouts\usmc_e_r.sqf"],
        ["Echo AR", "loadouts\usmc_e_ar.sqf"],
        ["Echo Heavy Weapons (Mortar)", "loadouts\usmc_e_mor.sqf"],
        ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\usmc_e_mor_ab.sqf"],
        ["Echo Heavy Weapons (HAT)", "loadouts\usmc_e_hat.sqf"],
        ["Echo Asst. Heavy Weapons (HAT)", "loadouts\usmc_e_hat_ab.sqf"],
        ["Echo Driver", "loadouts\usmc_e_d.sqf"]
    ]]
];

[this, _loadouts] call fw_fnc_addUniformsToBox;
