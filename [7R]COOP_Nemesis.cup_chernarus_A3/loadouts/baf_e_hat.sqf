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
_unit addVest "UK3CB_BAF_V_Osprey_DPMW2";
_unit addBackpack "UK3CB_BAF_B_Kitbag_DPMW";
_unit addHeadgear "UK3CB_BAF_H_Mk6_DPMW_E";
_unit addGoggles "UK3CB_BAF_G_Tactical_Clear";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L85A2";
_unit addWeapon "UK3CB_BAF_L131A1";
_unit addHandgunItem "UK3CB_BAF_9_17Rnd";
_unit addWeapon "UK3CB_BAF_Javelin_CLU";
_unit addWeapon "UK3CB_BAF_Javelin_Slung_Tube";

comment "Add items";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "SmokeShell";
_unit addItemToUniform "Chemlight_green";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_mk84";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 3 do {_unit addItemToBackpack "ACE_CableTie";};
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";

comment "Add ammo";
for "_i" from 1 to 2 do {_unit addItemToVest "UK3CB_BAF_9_17Rnd";};
for "_i" from 1 to 12 do {_unit addItemToVest "UK3CB_BAF_556_30Rnd";};

if (missionNamespace getVariable ["SR_Night", false]) then {
    _unit linkItem "Y_Headlamp_01";
    _unit setUnitTrait ["camouflageCoef", SR_Camo_Coef];
};
_unit setVariable ["SR_Class", "EH", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout", getUnitLoadout _unit];
