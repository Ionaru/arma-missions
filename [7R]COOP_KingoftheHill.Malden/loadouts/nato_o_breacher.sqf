_unit = (_this select 1);
if( !local _unit ) exitWith {};

comment "Remove existing items";
removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

comment "Uniform";
_unit forceAddUniform "U_B_CombatUniform_mcam_wdl_f";
_unit addVest "V_PlateCarrier1_wdl";
_unit addBackpack "B_Carryall_wdl_F";
_unit addHeadgear "H_HelmetB_plain_wdl";
_unit addGoggles "rhs_googles_black";

comment "Basic";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemGPS";
_unit addItemToUniform "ACE_MapTools";
_unit addItemToUniform "SR_PAK";
_unit addItemToUniform "ACE_Flashlight_MX991";
_unit addItemToUniform "Chemlight_green";
_unit addItemToUniform "ACRE_PRC343";
_unit addItemToUniform "16Rnd_9x21_Mag";
_unit addItemToVest "16Rnd_9x21_Mag";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_tourniquet";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};

comment "Role";
for "_i" from 1 to 3 do {_unit addItemToVest "SmokeShell";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "prpl_6Rnd_12Gauge_Pellets";};
for "_i" from 1 to 6 do {_unit addItemToBackpack "prpl_6Rnd_12Gauge_Slug";};
_unit addItemToBackpack "RH_SFM952V";
_unit addItemToBackpack "prpl_benelli_14_rail";
for "_i" from 1 to 8 do {_unit addItemToVest "30Rnd_65x39_caseless_black_mag";};

comment "Add weapons";
_unit addWeapon "arifle_MX_Black_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addWeapon "hgun_P07_F";
_unit addHandgunItem "16Rnd_9x21_Mag";
_unit addWeapon "Binocular";

comment "Framework";
if (isNil "SR_Night") then {SR_Night = false};
if (SR_Night) then {
	_unit linkItem "NVGoggles_INDEP";
	_unit setUnitTrait ["camouflageCoef", SR_Camo_Coef];
	_unit addItemToUniform "ACE_IR_Strobe_Item";
};
_unit setVariable ["SR_Class", "B", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout", getUnitLoadout _unit];
