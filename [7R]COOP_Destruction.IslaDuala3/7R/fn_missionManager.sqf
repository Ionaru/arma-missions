/*
	Parameters:
		<-- Phase Number as Integer

	Description:
	Modify and add unit spawn template code per phase.

	You can also use it to spawn counter attacks, just handle them as a Phase.
	Add further case in the switch-do-loop.

	Make Phase Variable an Integer. On trigger Act. use instead of phase = true; phase = phase + 1 or phase = 2.

	Example:
		nul = [1] spawn fw_fnc_missionManager;

*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];

_civilians = [
	"C_man_p_beggar_F_afro",
	"C_Man_casual_1_F_afro",
	"C_Man_casual_2_F_afro",
	"C_man_polo_2_F_afro",
	"C_man_polo_5_F_afro",
	"C_man_polo_6_F_afro",
	"C_man_p_fugitive_F_afro",
	"C_Man_casual_3_F_afro"
];

// Phase Case means Phase
switch (_nbr) do {

	// Phase 1 - (Init) - Populate bridge-bunkers + tower + hilltop
    case 1: {

		_handle = ["bridge_bunker_point", "GARRISON", 5, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["bridge_bunker_point", "GARRISON", 5, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["tower_point", "PATROL", 2, ["bunker_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;
		_handle = ["tower_point", "PATROL", 2, ["bunker_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;
		_handle = ["tower_point", "PATROL", 3, ["bunker_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;
		_handle = ["tower_point", "PATROL", 4, ["bunker_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;

		_handle = ["tower_point", "PATROL", 2, ["bridge_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;
		_handle = ["tower_point", "PATROL", 2, ["bridge_tower_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle}; sleep 5;

		_handle = ["tower_point", "GARRISON", 1, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tower_point", "GARRISON", 4, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tower_point", "GARRISON", 5, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["hilltop_point", "PATROL", 2, ["hilltop_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["hilltop_point", "PATROL", 2, ["hilltop_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		"Mission Loaded, good luck! o7" remoteExec ["systemChat", 0];
	};

	// Phase 2 - (Storage intel) - Populate base + Lapoto
    case 2: {

		"storage_marker" setMarkerAlpha 1;

		_handle = ["base_civ_zone", _civilians, 15] spawn fw_fnc_civSpawn; waitUntil {scriptDone _handle};

		_handle = ["base_point", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "GARRISON", 4, [150]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "GARRISON", 4, [150]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "GARRISON", 4, [150]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["base_point", "PATROL", 2, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 2, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 4, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 3, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 6, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["base_point", "PATROL", 2, ["base_outer_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 2, ["base_outer_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 2, ["base_outer_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 2, ["base_outer_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["base_point", "PATROL", 2, ["base_outer_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Phase 3 - (Base entered) - Base counter + populate storage
	case 3: {

		_handle = ["base_vic_spawn", "VEHICLE", 10, ["base_reinforce_point", false, ["base_inner_zone", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["storage_point", "PATROL", 2, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 2, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 2, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 4, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 4, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 4, ["base_inner_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 15;

		_handle = ["storage_point", "GARRISON", 2, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "GARRISON", 2, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["storage_point", "PATROL", 2, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 4, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["storage_point", "PATROL", 5, ["base_inner_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Phase 4 - (Camo intel) - Populate camo + base counter
	case 4: {

		"camo_marker" setMarkerAlpha 1;

		_handle = ["base_vic_spawn", "VEHICLE", 11, ["base_reinforce_point", false, ["base_inner_zone", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;


		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_point", "PATROL", 2, ["camo_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_point", "PATROL", 2, ["camo_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		[base_rampage] spawn fw_fnc_rampageArea;
	};

	// Phase 5 (Camo entered) - Heli spawn + Camo counter
	case 5: {

		{if (side _x == civilian) then {_x setDamage 1;};} forEach allUnits;

		_handle = ["camo_counter_point", "PATROL", 4, ["camo_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_counter_point", "PATROL", 4, ["camo_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_counter_point", "PATROL", 4, ["camo_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_counter_point", "PATROL", 4, ["camo_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_counter_point", "PATROL", 2, ["camo_north_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["camo_counter_point", "PATROL", 2, ["camo_north_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Phase 6 - (Camo destroy) - Populate Ravane + Poplate Tarisol + Populate West
	case 6: {

		[camo_rampage] spawn fw_fnc_rampageArea;

		"heli_zone" setMarkerAlpha 1;

		_handle = ["tarisol_zone", _civilians, 30] spawn fw_fnc_civSpawn; waitUntil {scriptDone _handle};
		_handle = ["ravane_zone", _civilians, 20] spawn fw_fnc_civSpawn; waitUntil {scriptDone _handle};

		_handle = ["west_point", "PATROL", 2, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 2, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 2, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 3, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 4, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 4, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 5, ["west_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["west_point", "PATROL", 2, ["west_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 3, ["west_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 4, ["west_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 4, ["west_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "PATROL", 5, ["west_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["tarisol_base_point", "GARRISON", 4, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tarisol_base_point", "GARRISON", 4, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tarisol_base_point", "GARRISON", 4, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["tarisol_base_point", "PATROL", 2, ["tarisol_base_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tarisol_base_point", "PATROL", 2, ["tarisol_base_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["tarisol_base_point", "PATROL", 2, ["tarisol_base_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["west_point", "GARRISON", 2, [200]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "GARRISON", 2, [200]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "GARRISON", 4, [200]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_point", "GARRISON", 4, [200]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Phase 7 - (North intel) - West counter + Populate North
	case 7: {

		"north_marker" setMarkerAlpha 1;

		_handle = ["west_counter_point", "PATROL", 2, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 3, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 4, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 4, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 5, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		[west_rampage] spawn fw_fnc_rampageArea;

		sleep 20;

		_handle = ["west_counter_point", "PATROL", 2, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 3, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 4, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 4, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["west_counter_point", "PATROL", 5, ["west_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["base_vic_spawn", "VEHICLE", 12, ["base_reinforce_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Phase 8 - (North destroy) - Populate Razfook + Populate East + Populate Mochiwo
	case 8: {
		{if (side _x == civilian) then {_x setDamage 1;};} forEach allUnits;

		_handle = ["razfook_point", "PATROL", 2, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "PATROL", 2, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "PATROL", 3, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "PATROL", 3, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "PATROL", 4, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "PATROL", 4, ["razfook_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["razfook_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["pre_east_point", "PATROL", 2, ["pre_east_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_east_point", "PATROL", 2, ["pre_east_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_east_point", "PATROL", 2, ["pre_east_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["east_point", "PATROL", 2, ["razfook_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 3, ["razfook_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 4, ["razfook_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 5, ["razfook_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 5, ["razfook_zone", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["mochiwo_zone", _civilians, 20] spawn fw_fnc_civSpawn; waitUntil {scriptDone _handle};

		_handle = ["east_vic_point", "VEHICLE", 12, ["razfook_point", false, ["base_inner_zone", "R"], 4]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["east_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["east_point", "PATROL", 2, ["east_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 2, ["east_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 2, ["east_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 2, ["east_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_point", "PATROL", 2, ["east_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Phase 9 - (East entered) - East counter
	case 9: {

		_handle = ["east_boat_spawn", "VEHICLE", 30, ["boat_wp", false, ["east_point", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["east_boat_spawn", "VEHICLE", 30, ["boat_wp", false, ["east_point", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["east_boat_spawn", "VEHICLE", 30, ["boat_wp", false, ["east_point", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["east_heli_spawn", "VEHICLE", 20, ["east_point", false, ["east_point", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Phase 99 - (East tank destroyed) - Debrief
	case 99: {
		{if (side _x == opfor || side _x == independent || side _x == civilian) then {_x setDamage 1;};} forEach allUnits;

		[[blufor, "HQ"], "Well done, PL-1. Report for debrief."] remoteExec ["sideChat", 0];
	};
};
