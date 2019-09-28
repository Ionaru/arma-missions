// JIP Teleporter Init

if (_this select 1) then {
	(_this select 0) addAction ["<t color='#FF0000'>JIP Teleporter</t>",fw_fnc_jipTeleport,nil,0,false,true,"","(_target distance2D (markerPos 'respawn_west') < 75)"];
};

// =====================================================================================================================================================

// Briefing Init
nul = execVM "briefing.sqf";

// =====================================================================================================================================================

// Support System Inits

_headerSupport = ["7R_Header","Command Support","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\radio_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _headerSupport] call ace_interact_menu_fnc_addActionToClass;

// Supply Drop
_SSR = ["7R_StatusRep","Status Report","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\talk_ca.paa",{null =  [] spawn fw_fnc_supplyDropReport},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _SSR] call ace_interact_menu_fnc_addActionToClass;

// Markers
_headerMarker = ["7R_Marker","Marker Designation","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\map_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerMarker] call ace_interact_menu_fnc_addActionToClass;

_RIM = ["7R_REINF","Designate REIN Marker","",{null = ["REINF", "REINF", "ColorBlue", "hd_start", true] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _RIM] call ace_interact_menu_fnc_addActionToClass;
_EZM = ["7R_EZ","Designate Extraction Point","",{null = ["EZ", "EZ", "ColorBlue", "hd_pickup", true] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_Marker"], _EZM] call ace_interact_menu_fnc_addActionToClass;
_SDM = ["7R_SupplyDrop","Mark Supply DZ","",{null = ["SupplyDrop", "Supply DZ", "ColorBlue", "hd_join", false] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _SDM] call ace_interact_menu_fnc_addActionToClass;

_ATM = ["7R_Artillery","Designate Artillery-Target","",{null = ["ArtilleryTarget", "ORD-T", "ColorRed", "hd_destroy", false, [0.7,0.7]] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _ATM] call ace_interact_menu_fnc_addActionToClass;

_CTM = ["7R_Artillery","Designate CAS-Target","",{null = ["CASTarget", "CAS-T", "ColorRed", "hd_destroy", false, [0.7,0.7]] spawn fw_fnc_designateMarker},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header","7R_Marker"], _CTM] call ace_interact_menu_fnc_addActionToClass;

// Supply Drop
_headerSupply = ["7R_SupplyH","Call Supplies","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\box_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerSupply] call ace_interact_menu_fnc_addActionToClass;

_CVA1 =  ["7R_SupplyDropAir","Call Supply Drop (1 Box)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 1] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA1] call ace_interact_menu_fnc_addActionToClass;

_CVA2 =  ["7R_SupplyDropAir","Call Supply Drop (2 Boxes)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 2, 1] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA2] call ace_interact_menu_fnc_addActionToClass;

_CVA3 =  ["7R_SupplyDropAir","Call Supply Drop (3 Boxes)","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 3, 1] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA3] call ace_interact_menu_fnc_addActionToClass;

_CVA5 =  ["7R_SupplyDropAir","Call Fortification Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 3] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA5] call ace_interact_menu_fnc_addActionToClass;

_CVA6 =  ["7R_SupplyDropAir","Call Special Equipment Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 4] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA6] call ace_interact_menu_fnc_addActionToClass;

_CVA7 =  ["7R_SupplyDropAir","Call Medical Supply Drop","7R\Supplies\7r_SD.paa",{null = ["SupplyDrop","STARTSPAWN","RHS_C130J","Stallion 5-1", 1, 7] spawn fw_fnc_supplyDropInit},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header", "7R_SupplyH"], _CVA7] call ace_interact_menu_fnc_addActionToClass;

_CHH = [
	"7R_VehicleDropHeader",
	"Vehicle Drop",
	"a3\ui_f\data\IGUI\Cfg\simpleTasks\types\car_ca.paa",
		{null = [] spawn fw_fnc_supplyDropReport},
		{[_player] call fw_fnc_canCallVehicleDrop},
		{[_target, _player, []] call fw_fnc_vehicleDropAction}
		] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _CHH] call ace_interact_menu_fnc_addActionToClass;

// Extraction
_EZC = ["7R_EZ","Call Extraction","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\heli_ca.paa",{null = ["EZ","STARTSPAWN", "RHS_CH_47F", "Eagle 1-1", 0,"dropoff"] spawn fw_fnc_exfilCall;},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header"], _EZC] call ace_interact_menu_fnc_addActionToClass;


// Artillery
_headerArtillery = ["7R_ArtyH","Call Fire Support","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\destroy_ca.paa",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","7R_Header"], _headerArtillery] call ace_interact_menu_fnc_addActionToClass;

_headerArty = ["7R_ArtilleryHeader","Artillery Fire Mission","",{},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH"], _headerArty] call ace_interact_menu_fnc_addActionToClass;

_ACA3 = ["7R_Artillery","3 Rounds","",{null = ["ArtilleryTarget","Sh_155mm_AMOS",3,25,10] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA3] call ace_interact_menu_fnc_addActionToClass;
_ACA5 = ["7R_Artillery","5 Rounds","",{null = ["ArtilleryTarget","Sh_155mm_AMOS",5,50,10] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA5] call ace_interact_menu_fnc_addActionToClass;
_ACA7 = ["7R_Artillery","7 Rounds","",{null = ["ArtilleryTarget","Sh_155mm_AMOS",7,75,10] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA7] call ace_interact_menu_fnc_addActionToClass;
_ACA8 = ["7R_Artillery","Cluster","",{null = ["ArtilleryTarget","Cluster_155mm_AMOS",1,25,10,3] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACA8] call ace_interact_menu_fnc_addActionToClass;
_ACAS = ["7R_Artillery","Smoke Barrage","",{null = ["ArtilleryTarget","UK3CB_BAF_WPSmoke_81mm_AMOS",7,100,10,1] spawn fw_fnc_artillery},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH", "7R_ArtilleryHeader"], _ACAS] call ace_interact_menu_fnc_addActionToClass;

// CAS
_CAS1 = ["7R_CAS","Call CAS","",{["CASTarget",3,"B_Plane_Fighter_01_F",0,"STARTSPAWN"] remoteExec ["fw_fnc_CAS",0];},{[_player] call fw_fnc_isLeader}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions", "7R_Header","7R_ArtyH"], _CAS1] call ace_interact_menu_fnc_addActionToClass;

// Pilot Recall
_CRC = {(player getVariable ["SR_Class","Rifleman"]) in ["Pilot","TC"] && (vehicle player == player)};
_rec = ["7R_SD_SpawnH","Base Recall","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\exit_ca.paa",{nul = [_player,_player] spawn fw_fnc_recall;},_CRC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_TeamManagement"], _rec] call ace_interact_menu_fnc_addActionToClass;

// Pilot Supply Spawn
_CSC = {(player getVariable ["SR_Class","Rifleman"]) isEqualTo "Pilot"};
_CSH = ["7R_SD_SpawnH","Sling Load Supply Spawn","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\container_ca.paa",{},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _CSH] call ace_interact_menu_fnc_addActionToClass;

_CS0 = ["7R_SD_Spawn","Clear Sling Load Pad","",{nul = [0,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS0] call ace_interact_menu_fnc_addActionToClass;

_CS1 = ["7R_SD_Spawn","Inf Supply Drop","",{nul = [1,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS1] call ace_interact_menu_fnc_addActionToClass;

_CS3 = ["7R_SD_Spawn","Fortification Supply Drop","",{nul = [3,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS3] call ace_interact_menu_fnc_addActionToClass;

_CS4 = ["7R_SD_Spawn","Special Supply Drop","",{nul = [4,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS4] call ace_interact_menu_fnc_addActionToClass;

_CS7 = ["7R_SD_Spawn","Medical Supply Drop","",{nul = [7,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS7] call ace_interact_menu_fnc_addActionToClass;

_CS5 = ["7R_SD_Spawn","Small Squad Resupply","",{nul = [5,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS5] call ace_interact_menu_fnc_addActionToClass;

_CS6 = ["7R_SD_Spawn","Small Special Weapons Resupply","",{nul = [6,slingpad] spawn fw_fnc_cargoSpawn;},_CSC] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment","7R_SD_SpawnH"], _CS6] call ace_interact_menu_fnc_addActionToClass;

// Undercover
_uc1 = ["7R_UC","Go Undercover","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\scout_ca.paa",{nul = [_player] spawn fw_fnc_goUndercover;},{(CBA_MissionTime - SR_SuspicionSpotted > 60) && _player getVariable ["SR_Class","R"] isEqualto "UC" && !(_player getVariable ["SR_UC",false])}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _uc1] call ace_interact_menu_fnc_addActionToClass;

_uc2 = ["7R_UC","Exit Undercover","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rifle_ca.paa",{nul = [_player] spawn fw_fnc_exitUndercover;},{_player getVariable ["SR_UC",false]}] call ace_interact_menu_fnc_createAction;
[(typeOf player), 1, ["ACE_SelfActions"], _uc2] call ace_interact_menu_fnc_addActionToClass;


// Hacking
SR_Hack_Area = [];
if (count SR_Hack_Area != 0) then {
	_hackC = {({position player inArea _x} count SR_Hack_Area) > 0 && "ARP_Objects_Laptop_M" in items player};
	_hack = ["7R_Hack","Start Hack","a3\ui_f\data\IGUI\Cfg\simpleTasks\types\intel_ca.paa",{[SR_Hack_Area,player] spawn fw_fnc_hackingAction},_hackC] call ace_interact_menu_fnc_createAction;
	[(typeOf player), 1, ["ACE_SelfActions","ACE_Equipment"], _hack] call ace_interact_menu_fnc_addActionToClass;
};

// NVG Adjustments (DO NOT TOUCH)
ace_nightvision_fogScaling = 0.5;
ace_nightvision_effectScaling = 0.5;
