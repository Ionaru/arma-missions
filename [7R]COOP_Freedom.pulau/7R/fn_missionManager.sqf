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

		{(3600 * timeMultiplier) setOvercast 1;} remoteExec ["bis_fnc_call", 0];

		sleep 120;

		// Civilians
		_handle = ["kinandal_zone", _civilians, 30, 0, 0, 10] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};

		// Patrols
		_handle = ["kinandal_patrol_west", "PATROL", 1, ["kinandal_patrol_west", "P"]] spawn fw_fnc_spawnTemplate;
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

		_handle = ["kinandal_patrol_south", "PATROL", 1, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 1, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 3, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_south", "PATROL", 2, ["kinandal_patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["kinandal_patrol_north", "PATROL", 1, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["kinandal_patrol_north", "PATROL", 1, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
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

		phase = 1;
		publicVariable "phase";

		"Mission Loaded, enjoy!" remoteExec ["systemChat", 0];
	};

    case 2: {

		{(1200 * timeMultiplier) setFog [0.05, 0.01, 0];} remoteExec ["bis_fnc_call", 0];

		"liberate_marker" setMarkerAlpha 0;
		"attack_marker" setMarkerAlpha 1;

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
		_handle = ["rockies", "PATROL", 1, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 1, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 1, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 3, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 3, ["kinandal_patrol_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 20;
		_handle = ["rockies_vic1", "VEHICLE", 4, ["rockies_vic1_wp", false, ["rockies", "P"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;

		// Spawn beach patrol
		// _handle = ["beach_patrol", "PATROL", 5, ["beach_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _handle};
		// _handle = ["beach_patrol", "PATROL", 5, ["beach_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _handle};
		_handle = ["beach_patrol", "PATROL", 2, ["beach_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["beach_patrol", "PATROL", 2, ["beach_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["beach_patrol", "PATROL", 2, ["beach_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["rockies", "PATROL", 1, ["rockies", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 1, ["rockies", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 1, ["rockies", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 1, ["rockies", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies", "PATROL", 3, ["rockies", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["rockies_vic2", "VEHICLE", 7, ["rockies_vic2_wp", true, ["rockies", "P"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};


	};

	case 3: {

		{(1800 * timeMultiplier) setRain 1;} remoteExec ["bis_fnc_call", 0];
		{(1200 * timeMultiplier) setFog [0.15, 0.01, 0];} remoteExec ["bis_fnc_call", 0];

		_handle = ["bunker_vic", "VEHICLE", 7, ["bunker_vic", true]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["bunker_bunker", "PATROL", 1, ["bunker_bunker", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_bunker", "PATROL", 1, ["bunker_bunker", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_bunker", "PATROL", 1, ["bunker_bunker", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_bunker", "PATROL", 1, ["bunker_bunker", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_bunker", "PATROL", 1, ["bunker_bunker", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["bunker_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["bunker_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		for "_i" from 1 to 10 do {
			_handle = ["bases_zone", "PATROL", 2, ["bases_zone", "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		};

		sleep 60;

		_handle = ["castle_zone", "PATROL", 1, ["castle_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["castle_zone", "PATROL", 1, ["castle_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["castle_zone", "PATROL", 1, ["castle_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["castle_zone", "PATROL", 1, ["castle_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["castle_zone", "PATROL", 1, ["castle_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};

	case 4: {

		"attack_marker" setMarkerAlpha 0;
		"attack2_marker" setMarkerAlpha 1;

		{
			if (side _x == civilian || side _x == opfor) then
			{
				_x setDamage 1;
			};

		} forEach allUnits;

		// Rampage remaining units
		{
			private _group = _x;
			if (side _group == independent) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		sleep 30;

		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 3, ["bunker_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["fort_vic", "VEHICLE", 7, ["fort_vic", true]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};

	case 5: {

		"attack2_marker" setMarkerAlpha 0;
		"crush_marker" setMarkerAlpha 1;

		_handle = ["crossroads_zone", "PATROL", 2, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["crossroads_zone", "PATROL", 2, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["crossroads_zone", "PATROL", 2, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		for "_i" from 1 to 10 do {
			sleep 10;
			_handle = ["minanga", "PATROL", 2, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		};

		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["bases_zone", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["minanga", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	case 6: {

		{(1800 * timeMultiplier) setRain 0;} remoteExec ["bis_fnc_call", 0];
		{(2400 * timeMultiplier) setFog [0.05, 0.01, 0];} remoteExec ["bis_fnc_call", 0];

		// Rampage remaining units
		{
			private _group = _x;
			if (side _group == opfor || side _group == independent) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		_handle = ["minanga", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["minanga", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["minanga_vic", "VEHICLE", 7, ["crossroads", false, ["crossroads", "P"]]] spawn fw_fnc_spawnTemplate;;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["tip_zone", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 1, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 3, ["crossroads_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["tip_vic", "VEHICLE", 4, ["crossroads", false, ["rockies", "P"]]] spawn fw_fnc_spawnTemplate;;
		waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["tip_zone", "GARRISON", 1, [150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "GARRISON", 1, [150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "GARRISON", 1, [150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "GARRISON", 3, [150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "GARRISON", 3, [150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["tip_zone", "PATROL", 1, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 1, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 3, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["tip_zone", "PATROL", 1, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 1, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["tip_zone", "PATROL", 3, ["tip_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		for "_i" from 1 to 10 do {
			sleep 10;
			_handle = ["beach_town", "PATROL", 2, ["beach_town", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		};

		_handle = ["beach_town", "PATROL", 1, ["beach_town", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["beach_town", "PATROL", 3, ["beach_town", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["beach_town", _civilians, 15, 0, 0, 25] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};

	};

	case 7: {

		{(120 * timeMultiplier) setOvercast 0;} remoteExec ["bis_fnc_call", 0];

		"crush_marker" setMarkerAlpha 0;
		"finish_marker" setMarkerAlpha 1;
		"boats_marker" setMarkerAlpha 1;

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

		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 1, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 3, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 3, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["base_island", "PATROL", 3, ["base_island", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	case 8: {

		{
			if (side _x == opfor || side _x == independent) then
			{
				_x setDamage 1;
			};

		} forEach allUnits;

		[[blufor, "HQ"], "Well done, PL-1. Report for debrief."] remoteExec ["sideChat", 0];

	};
};
