/*
	Parameters:
		<-- Box as Object
		<-- Type as Integer
*/

// Parameter Init
params ["_box",["_type",0]];

// Clear Box
clearweaponcargoGlobal _box;
clearmagazinecargoGlobal _box;
clearitemcargoGlobal _box;
clearBackpackCargoGlobal _box;

// Infantry Supply
if (_type == 1) then {
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 72];
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 24];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 20];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 8];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 12];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 12];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 10];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 5];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 3];
	_box addWeaponcargoGlobal ["BWA3_RGW90", 3];
	_box additemcargoGlobal ["BWA3_DM51A1", 10];
	_box additemcargoGlobal ["BWA3_DM25", 28];
	_box additemcargoGlobal ["BWA3_DM32_Yellow", 4];
	_box additemcargoGlobal ["BWA3_DM32_Orange", 4];
	_box additemcargoGlobal ["SR_HE_Pack", 4];
	_box additemcargoGlobal ["SR_Smoke_Pack", 4];
	_box additemcargoGlobal ["SR_Flare_Pack", 4];
	_box additemcargoGlobal ["rhs_mag_mk84", 10];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 4];
	_box additemcargoGlobal ["SLAMDirectionalMine_Wire_Mag", 4];
	_box additemcargoGlobal ["ClaymoreDirectionalMine_Remote_Mag", 4];
	_box additemcargoGlobal ["ACE_CableTie", 24];
	_box additemcargoGlobal ["Laserbatteries", 2];
	_box addItemCargoGlobal ["SR_PAK", 10];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 5];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 5];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 5];
	_box addBackpackCargoGlobal ["B_UAV_01_backpack_F", 1];
};

// Vehicle Supply
if (_type == 2) then {

};

// Special Supply
if (_type == 3) then {
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Shells", 24];
	_box addmagazinecargoGlobal ["UK3CB_BAF_1Rnd_60mm_Mo_Smoke_White", 12];
	_box addWeaponcargoGlobal ["UK3CB_BAF_Javelin_Slung_Tube", 2];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_M33", 2];
	_box addmagazinecargoGlobal ["rhsusf_mag_10Rnd_STD_50BMG_mk211", 1];
	_box addmagazinecargoGlobal ["rhsusf_5Rnd_762x51_m993_Mag", 8];
};

// Small Squad Supply
if (_type == 4) then {
	_box addmagazinecargoGlobal ["30Rnd_556x45_Stanag", 36];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch", 10];
	_box addmagazinecargoGlobal ["RH_12Rnd_45cal_usp", 8];
	_box additemcargoGlobal ["BWA3_DM51A1", 6];
	_box additemcargoGlobal ["MiniGrenade", 2];
	_box additemcargoGlobal ["BWA3_DM25", 16];
	_box additemcargoGlobal ["BWA3_DM32_Yellow", 4];
	_box additemcargoGlobal ["BWA3_DM32_Orange", 4];
	_box additemcargoGlobal ["SR_HE_Pack", 2];
	_box additemcargoGlobal ["SR_Smoke_Pack", 2];
	_box additemcargoGlobal ["SR_Flare_Pack", 2];
	_box additemcargoGlobal ["rhs_mag_mk84", 6];
	_box additemcargoGlobal ["ACE_CableTie", 16];
	_box addItemCargoGlobal ["SR_PAK", 8];
	_box addItemCargoGlobal ["SR_Bandage_Pack", 2];
	_box addItemCargoGlobal ["SR_Medicine_Pack", 2];
	_box addItemCargoGlobal ["SR_BloodIV_Pack", 2];
};

// Small Special Supply
if (_type == 5) then {
	_box addWeaponcargoGlobal ["rhs_weap_M136_hedp", 2];
	_box addmagazinecargoGlobal ["20Rnd_762x51_Mag", 8];
	_box addmagazinecargoGlobal ["rhsusf_100Rnd_762x51_m80a1epr", 5];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Pellets", 3];
	_box addmagazinecargoGlobal ["prpl_6Rnd_12Gauge_Slug", 3];
	_box addmagazinecargoGlobal ["MRAWS_HEAT_F", 2];
	_box addmagazinecargoGlobal ["MRAWS_HE_F", 1];
	_box additemcargoGlobal ["DemoCharge_Remote_Mag", 2];
	_box additemcargoGlobal ["SatchelCharge_Remote_Mag", 1];
};
