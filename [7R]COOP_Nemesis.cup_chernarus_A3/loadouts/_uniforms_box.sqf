_loadouts = [
    ["Platoon", "#ffff00", "\A3\ui_f\data\map\markers\nato\b_hq.paa", [
        ["Platoon Leader", "loadouts\baf_pl.sqf"],
        ["Platoon FAC", "loadouts\baf_p_fac.sqf"],
        ["Platoon Engineer (Demo)", "loadouts\baf_p_e_demo.sqf"],
        ["Platoon Engineer (EOD)", "loadouts\baf_p_e_eod.sqf"],
        ["Platoon Engineer (Fortification)", "loadouts\baf_p_e_fort.sqf"],
        ["Platoon Engineer (Repair)", "loadouts\baf_p_e_rep.sqf"],
        ["Platoon DMR", "loadouts\baf_p_dmr.sqf"],
        ["Platoon Driver", "loadouts\baf_p_d.sqf"],
        ["Platoon AR", "loadouts\baf_p_ar.sqf"],
        ["Platoon Medic", "loadouts\baf_p_medic.sqf"]
    ]],
    ["Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_inf.paa", [
        ["Squad Leader", "loadouts\baf_sl.sqf"],
        ["Combat Medic", "loadouts\baf_medic.sqf"],
        ["Infantry Rifle", "loadouts\baf_o_r.sqf"],
        ["Infantry AR", "loadouts\baf_o_ar.sqf"],
        ["Infantry Light AT (NLAW)", "loadouts\baf_o_lat_nlaw.sqf"],
        ["Infantry Light AT (ILAW)", "loadouts\baf_o_lat_ilaw.sqf"],
        ["Infantry MMG", "loadouts\baf_o_mmg.sqf"],
        ["Infantry Asst. MMG", "loadouts\baf_o_mmg_ab.sqf"],
        ["Infantry Medium AT", "loadouts\baf_o_mat.sqf"],
        ["Infantry Asst. Medium AT", "loadouts\baf_o_mat_ab.sqf"]
    ]],
    ["Specialist Infantry", "#00ff00", "\A3\ui_f\data\map\markers\nato\b_motor_inf.paa", [
        ["Infantry Grenadier", "loadouts\baf_o_g.sqf"],
        ["Infantry DMR", "loadouts\baf_o_dmr.sqf"],
        ["Infantry Specialist", "loadouts\baf_o_spc.sqf"],
        ["Infantry Battlerifle", "loadouts\baf_o_br.sqf"],
        ["Infantry Pointman", "loadouts\baf_o_cqc.sqf"],
        ["Infantry Breacher", "loadouts\baf_o_breacher.sqf"],
        ["Infantry Engineer (Demo)", "loadouts\baf_o_e_demo.sqf"],
        ["Infantry Engineer (EOD)", "loadouts\baf_o_e_eod.sqf"],
        ["Infantry Engineer (Fortification)", "loadouts\baf_o_e_fort.sqf"],
        ["Infantry Engineer (Repair)", "loadouts\baf_o_e_rep.sqf"]
    ]],
    ["Echo", "#ffa500", "\A3\ui_f\data\map\markers\nato\b_maint.paa", [
        ["Echo Rifleman", "loadouts\baf_e_r.sqf"],
        ["Echo AR", "loadouts\baf_e_ar.sqf"],
        ["Echo Engineer (Demo)", "loadouts\baf_e_e_demo.sqf"],
        ["Echo Engineer (EOD)", "loadouts\baf_e_e_eod.sqf"],
        ["Echo Engineer (Fortification)", "loadouts\baf_e_e_fort.sqf"],
        ["Echo Engineer (Repair)", "loadouts\baf_e_e_rep.sqf"],
        ["Echo Heavy Weapons (Mortar)", "loadouts\baf_e_mor.sqf"],
        ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\baf_e_mor_ab.sqf"],
        ["Echo Heavy Weapons (HAT)", "loadouts\baf_e_hat.sqf"],
        ["Echo Asst. Heavy Weapons (HAT)", "loadouts\baf_e_hat_ab.sqf"],
        ["Echo Driver", "loadouts\baf_e_d.sqf"]
    ]],
    ["Recon", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_recon.paa", [
        ["Sierra Spotter", "loadouts\baf_s_spotter.sqf"],
        ["Sierra Sniper", "loadouts\baf_s_sniper.sqf"]
    ]],
    ["Armor", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_armor.paa", [
        ["Foxtrot Commander", "loadouts\baf_f_com.sqf"],
        ["Foxtrot Crewman", "loadouts\baf_f_crew.sqf"],
        ["Foxtrot Technician", "loadouts\baf_f_tech.sqf"]
    ]],
    ["Air", "#ff0000", "\A3\ui_f\data\map\markers\nato\b_air.paa", [
        ["Rodeo Pilot", "loadouts\pilot_rotary.sqf"],
        ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"]
    ]]
];

[this, _loadouts] call fw_fnc_addUniformsToBox;
