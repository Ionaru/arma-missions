/*
	Parameters:
		<-- Phase Number as Integer

	Description:
	Modify and add unit spawn template code per phase.

	You can also use it to spawn counter attacks, just handle them as a Phase.
	Add further case in the switch-do-loop.

	Make Phase Variable an Integer. On trigger Act. use instead of phase = true; phase = phase + 1 or phase = 2.

	Example:
		nul = [0] spawn fw_fnc_missionManager;

*/

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];

_civilians = [
	"C_Man_casual_1_F_euro",
	"C_Man_casual_2_F_euro",
	"C_Man_casual_3_F_euro",
	"C_Man_casual_4_F_euro",
	"C_Man_casual_5_F_euro",
	"C_Man_casual_6_F_euro",
	"C_man_polo_1_F_euro",
	"C_man_polo_2_F_euro",
	"C_man_polo_3_F_euro",
	"C_man_polo_4_F_euro",
	"C_man_polo_5_F_euro",
	"C_man_polo_6_F_euro"
];

// Phase Case means Phase
switch (_nbr) do {

	// Initial phase: Populate Arudy.
    case 1: {
		_handle = ["pessagne_zone", _civilians, 10] spawn fw_fnc_civSpawn;
		_handle = ["arudy_zone", _civilians, 10] spawn fw_fnc_civSpawn;

		_handle = ["arudy_zone", "PATROL", 3, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 3, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 1, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 1, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 1, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 2, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 2, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_zone", "PATROL", 2, ["arudy_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["arudy_north_patrol", "PATROL", 1, ["arudy_north_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_north_patrol", "PATROL", 2, ["arudy_north_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_north_patrol", "PATROL", 2, ["arudy_north_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Entering Arudy: small reinforcements group.
	case 2: {

		_handle = ["arudy_counter_spawn_2", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_3", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_4", "VEHICLE", 11, ["arudy_point", false, ["arudy_zone", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["arudy_counter_spawn_2", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_3", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Arudy seized: counter-attack.
    case 3: {

		"arudy_objective" setMarkerAlpha 0;

		// Rampage remaining units.
		{
			private _group = _x;
			if (side _group == opfor && (leader _group) inArea "rampage_area_1") then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		[[blufor, "HQ"], "HQ detected a massive counter-attack coming from the east, defend the town!"] remoteExec ["sideChat", 0];

		_handle = ["arudy_counter_spawn_4", "VEHICLE", 10, ["arudy_point", false, ["arudy_zone", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_1", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["arudy_counter_spawn_1", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["arudy_counter_spawn_1", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_5", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["arudy_counter_spawn_1", "PATROL", 2, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["arudy_counter_spawn_1", "PATROL", 2, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["arudy_counter_spawn_2", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_3", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["arudy_counter_spawn_2", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_3", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["arudy_counter_spawn_2", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_3", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_4", "VEHICLE", 10, ["arudy_point", false, ["arudy_zone", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["arudy_counter_spawn_1", "PATROL", 1, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["arudy_counter_spawn_1", "PATROL", 1, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["arudy_counter_spawn_5", "PATROL", 3, ["arudy_point", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 600;

		// Rampage remaining units.
		{
			private _group = _x;
			if (side _group == opfor && (leader _group) inArea "rampage_area_1") then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		sleep 300;

		waitUntil {
			private _count = 0;
			{
				private _unit = _x;
				if (side _unit == opfor && _unit inArea "rampage_area_1") then {
					_count = _count + 1;
				}
			} forEach allUnits;

			if (_count < 15) exitWith {true};
			sleep 10;
			false;
		};

		arudy_held = true;
		publicVariable "arudy_held";
	};

	// Populate Goisse
	case 4: {

		_handle = ["goisse_zone", _civilians, 10] spawn fw_fnc_civSpawn;

		{
			private _unit = _x;
			if (side _unit == opfor && _unit inArea "rampage_area_1") then
			{
				_unit setDamage 1;
			};
		} forEach allUnits;

		"goisse_objective" setMarkerAlpha 1;

		_handle = ["goisse_patrol_out", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_out", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_out", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_out", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_out", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["goisse_patrol_side", "PATROL", 2, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_side", "PATROL", 2, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_side", "PATROL", 2, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_side", "PATROL", 2, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_side", "PATROL", 2, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_patrol_side", "PATROL", 3, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["goisse_zone", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_zone", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_zone", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_zone", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_zone", "PATROL", 1, ["goisse_patrol_out", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["goisse_lower_patrol", "PATROL", 1, ["goisse_lower_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_lower_patrol", "PATROL", 2, ["goisse_lower_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_lower_patrol", "PATROL", 2, ["goisse_lower_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["goisse_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_point", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};

	// Goisse entered, small counterattack.
	case 5: {

		// cleanup
		{
			private _unit = _x;
			if (_unit inArea "rampage_area_1") then
			{
				_unit setDamage 1;
			};
		} forEach allUnits;

		_handle = ["boat_spawn", "VEHICLE", 13, ["boat_wp", false, ["goisse_point", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_1", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["boat_spawn", "VEHICLE", 13, ["boat_wp", false, ["goisse_point", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_1", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["boat_spawn", "VEHICLE", 13, ["boat_wp", false, ["goisse_point", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_1", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Goisse cleared, proper counterattack.
	case 6: {

		"goisse_objective" setMarkerAlpha 0;
		"fort_objective" setMarkerAlpha 1;

		// 16
		_handle = ["goisse_counter_spawn_1", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		// 12
		_handle = ["goisse_counter_spawn_1", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_3", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		// 12
		_handle = ["goisse_counter_spawn_1", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_3", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 5;

		// 20
		_handle = ["goisse_counter_spawn_1", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_2", "PATROL", 3, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_3", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["goisse_counter_spawn_3", "PATROL", 2, ["goisse_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 300;

		{
			private _group = _x;
			if (side _group == opfor && (leader _group) inArea "rampage_area_2") then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

	};

	// Populate roadblock & fort.
	case 7: {

		_handle = ["roadblock_point", "GARRISON", 2, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["roadblock_point", "GARRISON", 2, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["roadblock_point", "GARRISON", 2, [50]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["bypass_bunker", "GARRISON", 2, [10]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["bypass_bunker", "GARRISON", 2, [10]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["bypass_bunker", "GARRISON", 2, [10]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["roadblock_point", "PATROL", 1, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["roadblock_left", "PATROL", 1, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["roadblock_right", "PATROL", 1, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["south_patrol", "PATROL", 1, ["south_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["south_patrol", "PATROL", 1, ["south_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["south_patrol", "PATROL", 2, ["south_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["roadblock_left", "PATROL", 3, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["roadblock_right", "PATROL", 3, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["roadblock_left", "PATROL", 3, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["roadblock_right", "PATROL", 3, ["roadblock_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		{
			private _unit = _x;
			if (_unit inArea "rampage_area_2") then
			{
				_unit setDamage 1;
			};
		} forEach allUnits;

		_handle = ["fort_bnk_1", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_2", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_bnk_3", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_4", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_5", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_6", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_bnk_7", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_8", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_9", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_10", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_11", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_12", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_bnk_13", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_14", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_15", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_16", "GARRISON", 1, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_bnk_17", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_bnk_18", "GARRISON", 2, [5]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["fort_point", "GARRISON", 1, [500]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_point", "GARRISON", 1, [500]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_point", "GARRISON", 1, [500]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_point", "GARRISON", 1, [500]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_point", "GARRISON", 1, [500]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 1, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["fort_zone", "PATROL", 2, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 2, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_zone", "PATROL", 2, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		// _handle = ["fort_zone", "PATROL", 2, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_zone", "PATROL", 2, ["fort_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Fort entered
	case 9: {
		_handle = ["heli_spawn", "AIR", 12, ["fort_point", "SAD", "AWARE", "fort_zone"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Fort seized, counter-attack.
	case 10: {

		"fort_objective" setMarkerAlpha 0;
		"airport_objective" setMarkerAlpha 1;

		{
			private _group = _x;
			if (side _group == opfor && (leader _group) inArea "fort_zone") then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;

		_handle = ["fort_counter_1", "PATROL", 2, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["fort_counter_1", "PATROL", 2, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["fort_counter_1", "VEHICLE", 10, ["fort_point", false, ["fort_zone", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["fort_counter_1", "PATROL", 2, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["fort_counter_1", "PATROL", 2, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "PATROL", 3, ["fort_point", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["heli_spawn", "AIR", 12, ["fort_point", "SAD", "AWARE", "fort_zone"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Populate Airport
	case 11: {

		_handle = ["fort_counter_1", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_1", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_1", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_1", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_1", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["fort_counter_2", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_2", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["fort_counter_3", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["fort_counter_3", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["pre_airport_zone", "PATROL", 1, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airport_zone", "PATROL", 1, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airport_zone", "PATROL", 1, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airport_zone", "PATROL", 1, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airport_zone", "PATROL", 1, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airport_zone", "PATROL", 3, ["pre_airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 300;

		_handle = ["airport_point", "GARRISON", 3, [400]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_point", "GARRISON", 3, [400]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_point", "GARRISON", 3, [400]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_point", "GARRISON", 1, [400]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_point", "GARRISON", 1, [400]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["airport_zone", "PATROL", 1, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 1, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 1, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 1, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 1, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 2, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 2, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airport_zone", "PATROL", 2, ["airport_zone", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["heli_spawn", "AIR", 12, ["airport_point", "SAD", "AWARE", "airport_zone"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

	// Opfor last stand
	case 12: {

		{
			private _unit = _x;
			if (_unit inArea "fort_zone") then
			{
				_unit setDamage 1;
			};
		} forEach allUnits;

		{
			private _group = _x;
			if (side _group == opfor) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;
	};

	case 99: {
		{
			if (side _x == opfor || side _x == independent) then
			{
				_x setDamage 1;
			};

		} forEach allUnits;

		[[blufor, "HQ"], "Well done, PL-1. Report for debrief."] remoteExec ["sideChat", 0];
	};
};

["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;


// this addaction ["<t color=""#00FF00"">" +"Spawn Truck", fw_fnc_vehicleSpawn, ["B_T_Truck_01_transport_F", v_pad]];
// this addaction ["<t color=""#00FF00"">" +"Spawn LTV", fw_fnc_vehicleSpawn, ["B_T_LSV_01_unarmed_F", v_pad]];
// this addaction ["<t color=""#00FF00"">" +"Spawn Armed LTV", fw_fnc_vehicleSpawn, ["B_T_LSV_01_armed_F", v_pad]];
// this addaction ["<t color=""#00FF00"">" +"Spawn MBT", fw_fnc_vehicleSpawn, ["B_T_MBT_01_TUSK_F", v_pad]];
// this addaction ["<t color=""#00FF00"">" +"Spawn Quad Bike", fw_fnc_vehicleSpawn, ["B_T_Quadbike_01_F", v_pad]];
