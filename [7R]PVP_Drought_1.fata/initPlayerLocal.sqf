params ["_playerUnit", "_didJIP"];

// =====================================================================================================================================================

// Briefing Init
nul = execVM "briefing.sqf";

// =====================================================================================================================================================

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

if (side player == opfor) then
{
	"destroy_drones_marker" setMarkerAlpha 0;
};

if (side player == blufor) then
{
	"defend_drones_marker" setMarkerAlpha 0;
};
