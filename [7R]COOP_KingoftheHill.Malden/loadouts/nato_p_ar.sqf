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
_unit forceAddUniform "U_B_CombatUniform_tshirt_mcam_wdL_f";
_unit addVest "V_PlateCarrier2_wdl";
_unit addBackpack "B_AssaultPack_wdl_F";
_unit addHeadgear "H_HelmetSpecB_wdl";
_unit addGoggles "rhs_googles_clear";

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
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_CableTie";};
for "_i" from 1 to 2 do {_unit addItemToVest "HandGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "SmokeShell";};

comment "Role";
_unit addItemToVest "200Rnd_65x39_cased_Box";
_unit addItemToVest "200Rnd_65x39_cased_Box";
for "_i" from 1 to 3 do {_unit addItemToBackpack "200Rnd_65x39_cased_Box";};

comment "Add weapons";
_unit addWeapon "LMG_Mk200_F";
_unit addPrimaryWeaponItem "acc_pointer_IR";
_unit addPrimaryWeaponItem "optic_Arco_AK_blk_F";
_unit addPrimaryWeaponItem "bipod_01_F_blk";
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
_unit setVariable ["SR_Class", "PAR", true];
_unit setVariable ["ace_isEngineer", 0, true];
_unit setVariable ["ace_medical_medicClass", 0, true];
_unit setVariable ["ACE_isEOD", false, true];
_unit setVariable ["SR_Loadout", getUnitLoadout _unit];
