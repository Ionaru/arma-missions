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
_unit forceAddUniform "U_B_PilotCoveralls";
_unit addHeadgear "H_PilotHelmetFighter_B";

comment "Add weapons";
_unit addWeapon "UK3CB_BAF_L131A1";
_unit addHandgunItem "UK3CB_BAF_9_17Rnd";
_unit addWeapon "binocular";

comment "Add items";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "ACRE_PRC152";
_unit addItemToUniform "ACE_Maptools";
_unit addItemToUniform "SR_PAK";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
_unit addItemToUniform "ACE_Flashlight_XL50";
_unit addItemToUniform "Chemlight_green";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";
for "_i" from 1 to 2 do {_unit addItemToUniform "SmokeShellPurple";};
_unit addItemToUniform "ACE_HandFlare_Green";
_unit addItemToUniform "ACE_microDAGR";

comment "Add ammo";
_unit addItemToUniform "UK3CB_BAF_9_17Rnd";

if (missionNamespace getVariable ["SR_Night", false]) then {
    _unit linkItem "UK3CB_BAF_HMNVS";
    _unit setUnitTrait ["camouflageCoef", 1];
};
_unit setVariable ["SR_Class", "Pilot", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout", getUnitLoadout _unit];
