_unit = (_this select 1);
if (!local _unit) exitwith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Add containers / clothing";
_unit forceAddUniform "UK3CB_BAF_U_CombatUniform_DPMW_ShortSleeve";
_unit addVest "UK3CB_BAF_V_Osprey_DPMW9";
_unit addBackpack "UK3CB_BAF_B_Bergen_DPMW_SL_A";
_unit addHeadgear "UK3CB_BAF_H_Mk6_DPMW_A";
_unit addGoggles "UK3CB_BAF_G_Tactical_Black";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L85A2_UGL_HWS";
_unit addPrimaryWeaponItem "UK3CB_BAF_SFFH";
_unit addPrimaryWeaponItem "UK3CB_BAF_LLM_IR_Black";
_unit addWeapon "UK3CB_BAF_L131A1";
_unit addHandgunItem "UK3CB_BAF_9_17Rnd";
_unit addWeapon "ACE_Vector";

comment "Add items";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToVest "ACRE_PRC152";
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
_unit addItemToBackpack "SmokeShellGreen";
_unit addItemToBackpack "SmokeShellRed";
for "_i" from 1 to 2 do {_unit addItemToBackpack "SmokeShellYellow";};
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";
_unit addItemToBackpack "UK3CB_BAF_H_Beret_Rifles";

comment "Add ammo";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_9_17Rnd";};
for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_556_30Rnd_T";};
for "_i" from 1 to 6 do {_unit addItemToVest "UK3CB_BAF_556_30Rnd";};
for "_i" from 1 to 8 do {_unit addItemToBackpack "1Rnd_HE_Grenade_shell";};
for "_i" from 1 to 4 do {_unit addItemToBackpack "1Rnd_Smoke_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeRed_Grenade_shell";};
for "_i" from 1 to 2 do {_unit addItemToBackpack "1Rnd_SmokeYellow_Grenade_shell";};

if (missionNamespace getVariable ["SR_Night", false]) then {
    for "_i" from 1 to 4 do {_unit addItemToBackpack "UGL_FlareWhite_F";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "UGL_FlareRed_F";};
	_unit linkItem "Y_Headlamp_01";
	_unit setUnitTrait ["camouflageCoef", SR_Camo_Coef];
};
_unit setVariable ["SR_Class", "PL", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout", getUnitLoadout _unit];
