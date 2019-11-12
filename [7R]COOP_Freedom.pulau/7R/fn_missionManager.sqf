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

_civilians = ["C_Man_4_enoch_F", "C_Man_casual_6_F_tanoan", "C_man_shorts_1_F_afro", "C_Orestes", "C_Man_casual_3_F_tanoan", "C_Man_1_enoch_F", "C_man_shorts_2_F_afro"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1
    case 1: {

		// Civilians
		_handle = ["kinandal_zone", _civilians, 30, 0, 0, 10] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};

		// Patrols
		_handle = ["kinandal_patrol_west", "PATROL", 3, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_west", "PATROL", 3, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_west", "PATROL", 2, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_west", "PATROL", 2, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_west", "PATROL", 2, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_west", "PATROL", 2, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["kinandal_patrol_south", "PATROL", 3, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 3, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 3, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["kinandal_patrol_north", "PATROL", 3, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 3, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 3, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 2, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 2, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 2, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Town garrison
		_handle = ["kinandal_zone", "PATROL", 2, ["kinandal_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_zone", "PATROL", 2, ["kinandal_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_zone", "PATROL", 2, ["kinandal_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_zone", "PATROL", 2, ["kinandal_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_zone", "PATROL", 2, ["kinandal_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};


		// _handle = ["os1_2","GARRISON",1,[150]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _handle};
		// _handle = ["a2",["LOP_CHR_Civ_Random"], 10,0] spawn fw_fnc_civSpawn;
		// waitUntil {scriptDone _handle};
		// _handle = ["vs1","VEHICLE",9,["is1",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _handle};

		phase = 1;
		publicVariable "phase";

		"Mission Loaded" remoteExec ["systemChat", 0];
		// ["MissionLog", ["Mission", "Phase 1 Loaded"]] spawn CBA_fnc_globalEvent;

		// "weve_had_enough_of_your_shit" call CBA_fnc_serverEvent;
		// ["tag_testEvent", "test message server"] call CBA_fnc_serverEvent;

	};
    case 2: {

		// Activate sleepers
		{
			private _unit = _x;
			if (side _unit == civilian) then
			{
				[_unit] spawn fw_fnc_civShooter;
			};
		} forEach allUnits;

		// Rampage remaining units
		{
			private _group = _x;
			if (side _group == opfor || side _group == independent) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		// Spawn incoming wave

	};
	case 3: {

	};
};
