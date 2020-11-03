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

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1
    case 1: {

		// Mike-26

		// _spawn = ["mike_patrol","PATROL",2,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["mike_patrol","PATROL",2,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["mike_patrol","PATROL",2,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",2,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",1,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",1,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",1,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",1,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_patrol","PATROL",1,["mike_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_spawn","GARRISON",1,[250]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_spawn","GARRISON",1,[250]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["mike_spawn","GARRISON",1,[250]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["mike_spawn","GARRISON",1,[250]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["mike_spawn","GARRISON",1,[250]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;

		phase = 1;
		publicVariable "phase";

		"Mission Loaded" remoteExec ["systemChat", 0];
		["MissionLog", ["Mission", "Phase 1 Loaded"]] spawn CBA_fnc_globalEvent;

	};
	case 2: {

		// Mike-26 cleared
		[[blufor, "HQ"], "Well done, PL-1. AAF troops are on their way to Mike-26 to fortify the position."] remoteExec ["sideChat", 0];

		_spawn=["spawn_maxwell_r_3","VEHICLE",7,["spawn_maxwell_r_1",true,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		createGuardedPoint [independent, getMarkerPos "mike_spawn", -1, objNull];

		_spawn=["aaf_spawn","VEHICLE",10,["mike_spawn",false,["mike_patrol","G"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		sleep 10;

		_spawn=["aaf_spawn","VEHICLE",11,["mike_spawn",false,["mike_patrol","G"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		[[blufor, "HQ"], "Proceed to Camp Maxwell"] remoteExec ["sideChat", 0];

	};
    case 3: {

		// Maxwell
		// Init download

		// _spawn = ["spawn_maxwell_1","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["spawn_maxwell_2","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["spawn_maxwell_1","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;

	};
	case 4: {

		// Maxwell
		// 10%

		// _spawn = ["spawn_maxwell_2","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["spawn_maxwell_2","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_1","PATROL",1,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",1,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn=["spawn_maxwell_r_2","VEHICLE",6,["maxwell_vic",false,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		sleep 10;
		_spawn=["spawn_maxwell_r_2","VEHICLE",6,["maxwell_vic",false,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 5: {

		// Maxwell
		// 30%

		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		sleep 20;
		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		// _spawn = ["spawn_maxwell_4","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;
		// _spawn = ["spawn_maxwell_6","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		// waitUntil {scriptDone _spawn}; sleep 2;

		sleep 20;
		_spawn=["spawn_maxwell_r_2","VEHICLE",8,["maxwell_vic",false,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 6: {

		// Maxwell
		// 60%

		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",3,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn=["spawn_maxwell_r_3","VEHICLE",8,["maxwell_vic",false,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn=["spawn_maxwell_r_2","VEHICLE",8,["maxwell_vic",false,["maxwell_zone","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		sleep 45;
		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		sleep 60;
		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",1,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 7: {

		// Maxwell
		// 90%

		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_4","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		sleep 60;

		_spawn = ["spawn_maxwell_1","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_6","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_2","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_1","PATROL",4,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_maxwell_3","PATROL",2,["maxwell_zone", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 8: {

		// Maxwell
		// 100%

		[[blufor, "HQ"], "Files received, PL-1, wait one."] remoteExec ["sideChat", 0];

		createGuardedPoint [opfor, getMarkerPos "opfor_rally", -1, objNull];
		{
			private _group = _x;
			if (side _group == opfor && _group != helo1 && _group != helo2) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		// Connor

		_spawn = ["connor_spawn","GARRISON",2,[100]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["connor_spawn","PATROL",2,["connor_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["connor_spawn","PATROL",2,["connor_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 9: {

		// The Spartan

		_spawn = ["spawn_spartan","GARRISON",1,[300]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","GARRISON",1,[300]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","GARRISON",1,[300]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","GARRISON",1,[300]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["patrol_lighthouse","PATROL",2,["patrol_lighthouse", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["patrol_lighthouse","PATROL",2,["patrol_lighthouse", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["patrol_spartan","PATROL",1,["patrol_spartan", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["patrol_spartan","PATROL",2,["patrol_spartan", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;
		_spawn = ["spawn_spartan","PATROL",1,["patrol_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _spawn}; sleep 2;

	};

	case 10: {

		// End

		{
			if (side _x == opfor) then
			{
				_x setDamage 1;
			};

		} forEach allUnits;

		[[blufor, "HQ"], "Well done, PL-1. Report for debrief."] remoteExec ["sideChat", 0];

	};
};
