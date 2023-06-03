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

_civilians = ["LOP_Tak_Civ_Random"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Initial, roadblock populate
	case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];

		_handle = ["roadblock_patrol_zone", "PATROL", 1, ["roadblock_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["roadblock_patrol_zone", "PATROL", 4, ["roadblock_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["roadblock_patrol_zone", "PATROL", 4, ["roadblock_patrol_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		phase = 0;
		publicVariable "phase";

		"Mission Loaded" remoteExec ["systemChat", 0];
	};
	// Phase 1, roadblock reinforcements.
	case 1: {

		_handle = ["roadblock_vic_reinf_spawn", "VEHICLE", 5, ["roadblock_rally", false, ["roadblock_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["roadblock_vic_reinf_spawn", "VEHICLE", 6, ["roadblock_dropoff", false, ["roadblock_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["roadblock_reinf_spawn", "PATROL", 1, ["roadblock_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["roadblock_reinf_spawn", "PATROL", 1, ["roadblock_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 5;

		_handle = ["roadblock_vic_reinf_spawn", "VEHICLE", 6, ["roadblock_dropoff", false, ["roadblock_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["roadblock_vic_reinf_spawn", "VEHICLE", 5, ["roadblock_rally", false, ["roadblock_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 120;

		_handle = ["roadblock_reinf_spawn", "PATROL", 2, ["roadblock_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["roadblock_reinf_spawn", "PATROL", 2, ["roadblock_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["roadblock_reinf_spawn", "PATROL", 2, ["roadblock_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	// Depot scout triggered
	case 2: {

		// 18 men
		_handle = ["depot_spawn", "PATROL", 1, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_spawn", "PATROL", 1, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// 10 men
		_handle = ["depot_spawn", "PATROL", 4, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_spawn", "PATROL", 4, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_spawn", "PATROL", 4, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_spawn", "PATROL", 4, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_spawn", "PATROL", 4, ["scout_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	// In range of depot
	case 3: {

		// Civilians
		_handle = ["depot_town_zone", _civilians, 10, 0, 0, 12] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};

		// Guards
		_handle = ["depot_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["depot_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["depot_town_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["depot_town_zone", "PATROL", 1, ["depot_town_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_zone", "PATROL", 4, ["depot_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_zone", "PATROL", 4, ["depot_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_zone", "PATROL", 4, ["depot_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_mine_road_area", "PATROL", 1, ["depot_mine_road_area", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_mine_road_area", "PATROL", 4, ["depot_mine_road_area", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_mine_road_area", "PATROL", 4, ["depot_mine_road_area", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_mine_road_area", "PATROL", 4, ["depot_mine_road_area", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_patrol_road", "PATROL", 1, ["depot_patrol_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_patrol_road", "PATROL", 4, ["depot_patrol_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_patrol_road", "PATROL", 4, ["depot_patrol_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	// Depot seized, counterattack & populate factory
	case 4: {

		// Rampage units
		[depot_trigger_zone] spawn fw_fnc_rampageArea;


		// Depot counterattack

		_handle = ["depot_reinf_2", "VEHICLE", 6, ["depot_dropoff", false, ["depot_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["depot_reinf_2", "VEHICLE", 5, ["depot_rally", false, ["depot_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 30;

		_handle = ["depot_reinf", "PATROL", 4, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf", "PATROL", 4, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf", "PATROL", 4, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["depot_reinf", "PATROL", 3, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 60;

		_handle = ["depot_reinf_2", "VEHICLE", 6, ["depot_dropoff", false, ["depot_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 300;

		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 60;

		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};


		// Populate factory

		_handle = ["factory_road", "PATROL", 4, ["factory_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["factory_road", "PATROL", 4, ["factory_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["factory_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["factory_zone", "PATROL", 1, ["depot_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_reinf", "VEHICLE", 5, ["depot_rally", false, ["depot_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	// Factory seized, counterattack & populate admin centre & populate hvt area & trigger sleepers
	case 5: {

		// Activate sleepers

		{
			private _unit = _x;
			if (side _unit == civilian) then
			{
				[_unit] spawn fw_fnc_civShooter;
			};
		} forEach allUnits;


		// Factory counterattack

		_handle = ["depot_reinf_2", "PATROL", 1, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf_2", "PATROL", 2, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf_2", "PATROL", 3, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["factory_reinf_marker", "PATROL", 1, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["factory_reinf_marker", "PATROL", 2, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["factory_reinf_marker", "PATROL", 3, ["depot_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 300;

		_handle = ["depot_reinf_2", "VEHICLE", 8, ["depot_reinf", false, ["depot_reinf", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 10;

		_handle = ["depot_reinf_2", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["factory_reinf_marker", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 60;

		_handle = ["factory_reinf_marker", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["depot_reinf_2", "PATROL", 2, ["depot_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["depot_reinf_2", "VEHICLE", 9, ["depot_reinf", false, ["depot_reinf", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 300;


		// Populate admin

		_handle = ["pre_admin_zone", "PATROL", 4, ["pre_admin_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["pre_admin_zone", "PATROL", 4, ["pre_admin_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["pre_admin_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["admin_zone", "PATROL", 2, ["admin_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_zone", "PATROL", 2, ["admin_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_road", "PATROL", 2, ["admin_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_bunker", "GARRISON", 4, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["admin_bunker_2", "GARRISON", 4, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["admin_bunker_3", "GARRISON", 4, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["admin_bunker_4", "GARRISON", 4, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["admin_bunker_patrol", "PATROL", 1, ["admin_bunker_patrol", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["admin_zone", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["hvt_road", "PATROL", 2, ["hvt_road", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	// Admin seized, counterattack & populate oil
	case 6: {

		// Admin counterattack

		_handle = ["admin_reinf", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf_2", "PATROL", 3, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf_2", "PATROL", 3, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["admin_reinf_2", "VEHICLE", 6, ["admin_dropoff", false, ["admin_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["admin_reinf_2", "VEHICLE", 5, ["admin_rally", false, ["admin_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["admin_reinf_2", "VEHICLE", 9, ["admin_rally", false, ["admin_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["admin_reinf", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf_2", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 60;

		_handle = ["admin_reinf_2", "VEHICLE", 9, ["admin_rally", false, ["admin_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["admin_reinf", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf_2", "PATROL", 2, ["admin_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;


		// Populate oil

		_handle = ["oil_defence_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["oil_defence_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["oil_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		_handle = ["oil_zone", "PATROL", 1, ["oil_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["oil_zone", "PATROL", 1, ["oil_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["oil_zone", "PATROL", 1, ["oil_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["oil_core", "PATROL", 4, ["oil_core", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["oil_core", "PATROL", 4, ["oil_core", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["oil_core", "PATROL", 4, ["oil_core", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["oil_core", "PATROL", 4, ["oil_core", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	// HVT triggered, counterattack
	case 7: {

		_handle = ["admin_reinf", "PATROL", 2, ["hvt_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf", "PATROL", 2, ["hvt_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["admin_reinf_2", "VEHICLE", 6, ["hvt_dropoff", false, ["hvt_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 20;

		_handle = ["admin_reinf", "PATROL", 2, ["hvt_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["admin_reinf", "PATROL", 2, ["hvt_rally", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

        sleep 10;

		_handle = ["admin_reinf_2", "VEHICLE", 8, ["hvt_dropoff", false, ["hvt_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	// Oil seized, counterattack & populate airport
	case 8: {

		_handle = ["oil_reinf", "VEHICLE", 8, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["oil_reinf", "VEHICLE", 6, ["oil_dropoff", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["oil_reinf", "VEHICLE", 5, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["oil_reinf", "VEHICLE", 6, ["oil_dropoff", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["oil_reinf", "VEHICLE", 5, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["oil_reinf", "VEHICLE", 6, ["oil_dropoff", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["oil_reinf", "VEHICLE", 5, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 10;

		_handle = ["oil_reinf", "VEHICLE", 5, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 20;

		_handle = ["oil_reinf", "VEHICLE", 8, ["oil_rally", false, ["oil_rally", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		sleep 600;


		// Populate pre-airfield

		_handle = ["pre_airfield_zone", "PATROL", 1, ["pre_airfield_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["pre_airfield_zone", "PATROL", 1, ["pre_airfield_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["pre_airfield_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["pre_airfield_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;


		// Populate airfield

		_handle = ["airfield_zone", "PATROL", 2, ["airfield_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone", "PATROL", 2, ["airfield_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone", "PATROL", 2, ["airfield_zone", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airfield_zone", "GARRISON", 2, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["airfield_zone_2", "PATROL", 1, ["airfield_zone_2", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_2", "PATROL", 1, ["airfield_zone_2", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_2", "PATROL", 1, ["airfield_zone_2", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_2", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_2", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		sleep 120;

		_handle = ["airfield_zone_3", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_3", "PATROL", 4, ["airfield_zone_3", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["airfield_zone_3", "PATROL", 4, ["airfield_zone_3", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};

	// Airport seized, counterattack
	case 9: {

		_handle = ["airfield_reinf", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;

		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;

		_handle = ["airfield_reinf_2", "VEHICLE", 8, ["oil_reinf", false, ["oil_reinf", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
        sleep 10;

		_handle = ["airfield_reinf_2", "VEHICLE", 5, ["oil_reinf", false, ["oil_reinf", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
        sleep 10;

		_handle = ["airfield_reinf_2", "VEHICLE", 5, ["oil_reinf", false, ["oil_reinf", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
        sleep 10;

		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;
		_handle = ["airfield_reinf_2", "PATROL", 2, ["oil_reinf", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		sleep 10;

		// Rampage all enemy units.
		{
			private _group = _x;
			if (side _group == opfor) then
			{
				_x setVariable ["SR_PatrolMode","RP"];
				deleteWaypoint [_x, 1];
			};
		} forEach allGroups;



	};
	case 100: {
		{
			if (side _x == opfor || side _x == civilian) then
			{
				_x setDamage 1;
			};

		} forEach allUnits;

		[[blufor, "HQ"], "Well done, 7R. Report for debrief."] remoteExec ["sideChat", 0];
	};
};

["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
