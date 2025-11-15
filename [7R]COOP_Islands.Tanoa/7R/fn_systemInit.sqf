/*
Mission parameters.
*/
SR_Unit_Cap = 200;
// maximum AI unit count, only change if absolutely necessary.

// Night mission settings
SR_AI_NVG = "";
SR_AI_removeNVG = true;
SR_AI_addFlashlight = false;
SR_AI_forceFlashlight = false;
// force AI to turn flashlight on.
SR_Night = false;
// set to 'true' when the mission is played entirely at night.
SR_Camo_Coef = 0.75;
// for Night Missions, default: 0.75

// Respawn Management
SR_spawn_Height = 1.04845;
// Height above ground the player should respawn (for respawning on ships). (check height in editor with: hint format ["%1", (getPosASL player) select 2])

/*
Available supply boxes.
[Box Class, Display name, Supply loadout Number, Opt. Quantity Number (default:1)]
*/
SR_SupplyBoxes = [
    ["SR_Supply_Crate_Empty", "infantry Supplies", 1, 3],
    ["ACE_Construction_Supplies", "fortification Supplies"],
    ["SR_basic_Box_Empty", "Sniper Supplies", 3],
    ["SR_explosives_Box_Empty", "Mortar Supplies", 8],
    ["SR_Special_Box_Empty", "HAT Supplies", 9],
    ["SR_ammo_Box_Empty", "infantry Supplies 1 (Small)", 4],
    ["SR_Special_Box_Empty", "infantry Supplies 2 (Small)", 5],
    ["SR_Medical_Empty", "Medical Supplies", 7],
    ["SR_CSW_Supplies", "crew Served Weapon Supplies", 10]
];

/*
Support Asset Class Array.
[vehicle Class, texture Array, Pylon Array]
*/
SR_Support_Assets = [
    /* ParadropPlane */ "RHS_C130J", // Alternatives: "UK3CB_BAF_Hercules_C3" (BAF), "UK3CB_BAF_Hercules_C4" (German), "UK3CB_TKA_O_C130J" (Russian, USSR)
    /* SupplydropPlane */ "RHS_C130J", // Alternatives: "UK3CB_BAF_Hercules_C3" (BAF), "UK3CB_BAF_Hercules_C4" (German), "UK3CB_TKA_O_C130J" (Russian, USSR)
    /* CASPlane */ "RHS_A10", // Alternatives: "RHS_Su25SM_vvs" (Russian/USSR)
    /* ExfilHelicopter */ "RHS_CH_47F_10", // Alternatives: "UK3CB_BAF_Merlin_HC3_32_MTP" (BAF), "RHS_Mi8AMT_vvs" (Russian/USSR)
    /* UAV*/ "UK3CB_BAF_MQ9_Reaper_Generic" // Alternatives: "B_UAV_02_dynamicloadout_F" / "UK3CB_BAF_MQ9_Reaper_Generic" (BLUEfor), "rhs_pchela1t_vvs" (Russian/USSR), "O_UAV_02_dynamicloadout_F" (opfor)
];
/*
UAV alternativ syntax (for setPylonLoadout):
[vehicle Class, Pylon Array]
Example:
["B_UAV_02_dynamicloadout_F", ["PylonRack_3Rnd_ACE_Hellfire_AGM114K", "PylonRack_3Rnd_ACE_Hellfire_AGM114N"]]

*/

/*
Available vehicle drops.
[Display name, vehicle Class, vehicle loadout Number, texture Array]
*/
SR_vehicle_drop = [];

/*
Available support assets.
*/
Supplydropammo = 20;
Artillerycallammo = 0;
CAScallammo = 10;
UAVcallammo = 5;
ace_trenches_trenchSupplies = 500;
