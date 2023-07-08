_loadouts = [
    ["Platoon", "#ffff00", "\A3\ui_f\data\map\markers\nato\b_hq.paa", [
        ["Platoon Leader", "loadouts\us_pl.sqf"],
        // ["Platoon FAC", "loadouts\us_p_fac.sqf"],
        ["Platoon Engineer (Demo)", "loadouts\us_p_e_demo.sqf"],
        ["Platoon Engineer (EOD)", "loadouts\us_p_e_eod.sqf"],
        ["Platoon Engineer (Fortification)", "loadouts\us_p_e_fort.sqf"],
        ["Platoon Engineer (Repair)", "loadouts\us_p_e_rep.sqf"],
        ["Platoon DMR", "loadouts\us_p_dmr.sqf"],
        ["Platoon Driver", "loadouts\us_p_d.sqf"],
        ["Platoon AR", "loadouts\us_p_ar.sqf"],
        ["Platoon UAV", "loadouts\us_p_uav.sqf"],
        ["Platoon Medic", "loadouts\us_p_medic.sqf"]
    ]],
    ["Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_inf.paa", [
        ["Squad Leader", "loadouts\us_sl.sqf"],
        ["Infantry Rifle", "loadouts\us_o_r.sqf"],
        ["Infantry AR", "loadouts\us_o_ar.sqf"],
        ["Infantry Light AT", "loadouts\us_o_lat.sqf"],
        ["Infantry MMG", "loadouts\us_o_mmg.sqf"],
        ["Infantry Asst. MMG", "loadouts\us_o_mmg_ab.sqf"],
        ["Infantry Medium AT", "loadouts\us_o_mat.sqf"],
        ["Infantry Asst. Medium AT", "loadouts\us_o_mat_ab.sqf"],
        ["Combat Medic", "loadouts\us_medic.sqf"]
    ]],
    ["Specialist Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", [
        ["Infantry Grenadier", "loadouts\us_o_g.sqf"],
        ["Infantry DMR (5.56)", "loadouts\us_o_dmr.sqf"],
        ["Infantry Battlerifle (SCAR-H LB)", "loadouts\us_o_br.sqf"],
        ["Infantry Specialist (SCAR-H CQC)", "loadouts\us_o_spc.sqf"],
        ["Infantry Breacher", "loadouts\us_o_breacher.sqf"],
        ["Infantry Engineer (Demo)", "loadouts\us_o_e_demo.sqf"],
        ["Infantry Engineer (EOD)", "loadouts\us_o_e_eod.sqf"],
        ["Infantry Engineer (Fortification)", "loadouts\us_o_e_fort.sqf"],
        ["Infantry Engineer (Repair)", "loadouts\us_o_e_rep.sqf"]
    ]],
    ["Echo", "#ffa500", "\A3\ui_f\data\map\markers\nato\b_maint.paa", [
        ["Echo Rifleman", "loadouts\us_e_r.sqf"],
        ["Echo AR", "loadouts\us_e_ar.sqf"],
        ["Echo Engineer (Demo)", "loadouts\us_e_e_demo.sqf"],
        ["Echo Engineer (EOD)", "loadouts\us_e_e_eod.sqf"],
        ["Echo Engineer (Fortification)", "loadouts\us_e_e_fort.sqf"],
        ["Echo Engineer (Repair)", "loadouts\us_e_e_rep.sqf"],
        ["Echo Heavy Weapons (Mortar)", "loadouts\us_e_mor.sqf"],
        ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\us_e_mor_ab.sqf"],
        ["Echo Heavy Weapons (HAT)", "loadouts\us_e_hat.sqf"],
        ["Echo Asst. Heavy Weapons (HAT)", "loadouts\us_e_hat_ab.sqf"],
        ["Echo Driver", "loadouts\us_e_d.sqf"]
    ]]
];

[this, _loadouts] call fw_fnc_addUniformsToBox;
