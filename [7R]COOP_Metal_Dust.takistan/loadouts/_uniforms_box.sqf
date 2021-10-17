this addaction ["Platoon Leader", "loadouts\rus_pl.sqf"];
this addaction ["Platoon FAC", "loadouts\rus_p_fac.sqf"];
this addaction ["Platoon Engineer (Demo)", "loadouts\rus_p_e_demo.sqf"];
this addaction ["Platoon Engineer (EOD)", "loadouts\rus_p_e_eod.sqf"];
this addaction ["Platoon Engineer (Fortification)", "loadouts\rus_p_e_fort.sqf"];
this addaction ["Platoon Engineer (Repair)", "loadouts\rus_p_e_rep.sqf"];
this addaction ["Platoon DMR", "loadouts\rus_p_dmr.sqf"];
this addaction ["Platoon Driver", "loadouts\rus_p_d.sqf"];
this addaction ["Platoon AR", "loadouts\rus_p_ar.sqf"];
this addaction ["Platoon Medic", "loadouts\rus_p_medic.sqf"];
this addaction ["Squad Leader", "loadouts\rus_sl.sqf"];
this addaction ["Combat Medic", "loadouts\rus_medic.sqf"];
this addaction ["Operator Rifle", "loadouts\rus_o_r.sqf"];
this addaction ["Operator AR", "loadouts\rus_o_ar.sqf"];
this addaction ["Operator Light AT", "loadouts\rus_o_lat.sqf"];
this addaction ["Operator MMG", "loadouts\rus_o_mmg.sqf"];
this addaction ["Operator Asst. MMG", "loadouts\rus_o_mmg_ab.sqf"];
this addaction ["Operator Medium AT", "loadouts\rus_o_mat.sqf"];
this addaction ["Operator Asst. Medium AT", "loadouts\rus_o_mat_ab.sqf"];
this addaction ["Operator Grenadier", "loadouts\rus_o_g.sqf"];
this addaction ["Operator Battlerifle (AKM)", "loadouts\rus_o_br.sqf"];
this addaction ["Operator Engineer (Demo)", "loadouts\rus_o_e_demo.sqf"];
this addaction ["Operator Engineer (EOD)", "loadouts\rus_o_e_eod.sqf"];
this addaction ["Operator Engineer (Fortification)", "loadouts\rus_o_e_fort.sqf"];
this addaction ["Operator Engineer (Repair)", "loadouts\rus_o_e_rep.sqf"];
this addaction ["Echo Rifleman", "loadouts\rus_e_r.sqf"];
this addaction ["Echo AR", "loadouts\rus_e_ar.sqf"];
this addaction ["Echo Engineer (Demo)", "loadouts\rus_e_e_demo.sqf"];
this addaction ["Echo Engineer (EOD)", "loadouts\rus_e_e_eod.sqf"];
this addaction ["Echo Engineer (Fortification)", "loadouts\rus_e_e_fort.sqf"];
this addaction ["Echo Engineer (Repair)", "loadouts\rus_e_e_rep.sqf"];
this addaction ["Echo Heavy Weapons (Mortar)", "loadouts\rus_e_mor.sqf"];
this addaction ["Echo Asst. Heavy Weapons (Mortar)", "loadouts\rus_e_mor_ab.sqf"];
this addaction ["Echo Heavy Weapons (SPG)", "loadouts\rus_e_SPG.sqf"];
this addaction ["Echo Asst. Heavy Weapons (SPG)", "loadouts\rus_e_SPG_ab.sqf"];
this addaction ["Echo Driver", "loadouts\rus_e_d.sqf"];
this addaction ["Fox Commander", "loadouts\rus_f_com.sqf"];
this addaction ["Fox Crewman", "loadouts\rus_f_crew.sqf"];
this addaction ["Fox Technician", "loadouts\rus_f_tech.sqf"];
this addaction ["Sierra Spotter", "loadouts\rus_s_spotter.sqf"];
this addaction ["Sierra Sniper", "loadouts\rus_s_sniper.sqf"];
this addaction ["Sierra Recon", "loadouts\rus_s_recon.sqf"];
this addaction ["Rodeo Pilot", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Rodeo Co-Pilot (Crewman)", "loadouts\pilot_rotaryPilot.sqf"];
this addaction ["Whiskey Pilot", "loadouts\pilot_fixedWing.sqf"];
this addaction ["<t color=""#0000FF"">" +"Save Loadout", {(_this select 1) setVariable ["SR_Loadout",getUnitLoadout (_this select 1)];}];
this addaction ["<t color=""#0000FF"">" +"Load Loadout", {(_this select 1)  setUnitLoadout ((_this select 1)  getVariable ["SR_Loadout",[]]);}];
