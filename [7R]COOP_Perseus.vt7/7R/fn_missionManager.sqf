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
    "C_man_polo_1_F_euro",
    "C_man_polo_2_F_euro",
    "C_man_polo_3_F_euro",
    "C_man_polo_4_F_euro",
    "C_man_polo_5_F_euro",
    "C_man_polo_6_F_euro",
    "C_Man_casual_1_F_euro",
    "C_Man_casual_2_F_euro",
    "C_Man_casual_3_F_euro",
    "C_Man_casual_4_v2_F_euro",
    "C_Man_casual_5_v2_F_euro",
    "C_Man_casual_6_v2_F_euro",
    "C_Man_casual_7_F_euro",
    "C_Man_casual_8_F_euro",
    "C_Man_casual_9_F_euro",
    "C_Man_smart_casual_1_F_euro"
];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Initial
    case 0: {

        // Roadblock patrols

		"Loading Mission" remoteExec ["systemChat", 0];

		_handle = ["zone_roadblock_patrol_X", "PATROL", 1, ["zone_roadblock_patrol_X", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["zone_roadblock_patrol_Y", "PATROL", 5, ["zone_roadblock_patrol_Y", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["zone_roadblock_patrol_Y", "PATROL", 6, ["zone_roadblock_patrol_Y", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		"Mission Loaded" remoteExec ["systemChat", 0];
	};
    case 1: {

        // Roadblock reinforcements

        _handle = ["spawn_roadblock_vic_reinf", "VEHICLE", 8, ["roadblock_marker", false, ["zone_roadblock_patrol_X", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_roadblock_reinf_south", "PATROL", 1, ["zone_roadblock_patrol_Y", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_roadblock_reinf_north", "PATROL", 1, ["zone_roadblock_patrol_Y", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};
	case 2: {

        // Camp patrols

        _handle = ["zone_camp_patrol_west", "PATROL", 1, ["zone_camp_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_west", "PATROL", 3, ["zone_camp_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_east", "PATROL", 1, ["zone_camp_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_east", "PATROL", 3, ["zone_camp_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_camp_patrol_lon", "PATROL", 1, ["zone_camp_patrol_lon", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_lon", "PATROL", 3, ["zone_camp_patrol_lon", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_lon", "PATROL", 5, ["zone_camp_patrol_lon", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_camp_patrol_lat", "PATROL", 1, ["zone_camp_patrol_lat", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_lat", "PATROL", 3, ["zone_camp_patrol_lat", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_lat", "PATROL", 5, ["zone_camp_patrol_lat", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_camp_patrol", "PATROL", 6, ["zone_camp_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol", "PATROL", 6, ["zone_camp_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_camp_patrol_south", "PATROL", 4, ["zone_camp_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_south", "PATROL", 4, ["zone_camp_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_camp_patrol_south", "PATROL", 3, ["zone_camp_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_camp", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};
	case 3: {

        // Camp reinforcements & HQ patrols

        _handle = ["zone_reinf_camp_n", "PATROL", 1, ["zone_camp", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_patrol_camp_base", "PATROL", 1, ["zone_camp", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_patrol_camp_base", "PATROL", 1, ["zone_camp", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        ["zone_patrol_camp_base", _civilians, 7] spawn fw_fnc_civSpawn;

        _handle = ["zone_patrol_camp_base", "PATROL", 1, ["zone_patrol_camp_base", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_patrol_camp_base", "PATROL", 3, ["zone_patrol_camp_base", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_base_south", "PATROL", 3, ["zone_base_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_south", "PATROL", 5, ["zone_base_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_east", "PATROL", 3, ["zone_base_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_east", "PATROL", 5, ["zone_base_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_west", "PATROL", 3, ["zone_base_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_west", "PATROL", 5, ["zone_base_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_north", "PATROL", 3, ["zone_base_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base_north", "PATROL", 5, ["zone_base_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base", "PATROL", 3, ["zone_base", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base", "PATROL", 3, ["zone_base", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_base", "PATROL", 3, ["zone_base", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_base", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};

    case 4: {

        // HQ reinforcements

        // _handle = ["spawn_factory_helo", "VEHICLE", 12, ["base_helo_dropoff", false, ["zone_base", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_base_n", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_base_e", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_reinf_base_n", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_base_e", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;


    };

    case 5: {

        // Second HQ reinforcements & residence patrols

        _handle = ["zone_residence", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_residence", "PATROL", 1, ["zone_base", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        ["zone_residence", _civilians, 10] spawn fw_fnc_civSpawn;

        _handle = ["zone_residence", "PATROL", 1, ["zone_residence", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_residence", "PATROL", 3, ["zone_residence", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_residence", "PATROL", 6, ["zone_residence", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_residence", "PATROL", 7, ["zone_residence", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    };

    case 6: {

        // Residence reinforcements & mining patrols

        _handle = ["zone_reinf_residence_ne", "PATROL", 1, ["zone_residence", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_residence_ne", "PATROL", 1, ["zone_residence", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_patrol_residence_mining", "PATROL", 1, ["zone_residence", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_patrol_residence_mining", "PATROL", 1, ["zone_patrol_residence_mining", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_patrol_residence_mining", "PATROL", 1, ["zone_patrol_residence_mining", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 120;

        ["zone_mining_d", _civilians, 2] spawn fw_fnc_civSpawn;

        _handle = ["zone_mining_a", "PATROL", 3, ["zone_mining_a", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_a", "PATROL", 5, ["zone_mining_a", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_mining_b", "PATROL", 1, ["zone_mining_b", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_b", "PATROL", 3, ["zone_mining_b", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_mining_c", "PATROL", 1, ["zone_mining_c", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_c", "PATROL", 1, ["zone_mining_c", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_mining_d", "PATROL", 7, ["zone_mining_d", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_d", "PATROL", 7, ["zone_mining_d", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_d", "PATROL", 3, ["zone_mining_d", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_mining", "PATROL", 1, ["zone_mining", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining", "PATROL", 1, ["zone_mining", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_mining_b", "GARRISON", 3, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_mining_c", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    };

    case 7: {

        // Mining reinforcements & factory patrols

        _handle = ["factory_spawn_vic_marker", "VEHICLE", 9, ["mining_vic_waypoint", false, ["zone_mining", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_patrol_south", "PATROL", 1, ["zone_mining", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_south", "PATROL", 1, ["zone_mining", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_mining_ne", "PATROL", 1, ["zone_mining", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_factory_patrol_south", "PATROL", 1, ["zone_factory_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_south", "PATROL", 3, ["zone_factory_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_south", "PATROL", 5, ["zone_factory_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_south", "PATROL", 6, ["zone_factory_patrol_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_patrol_east", "PATROL", 1, ["zone_factory_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_east", "PATROL", 3, ["zone_factory_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_east", "PATROL", 5, ["zone_factory_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_east", "PATROL", 6, ["zone_factory_patrol_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_patrol_west", "PATROL", 1, ["zone_factory_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_west", "PATROL", 3, ["zone_factory_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_west", "PATROL", 5, ["zone_factory_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_west", "PATROL", 6, ["zone_factory_patrol_west", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_patrol_north", "PATROL", 1, ["zone_factory_patrol_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_north", "PATROL", 3, ["zone_factory_patrol_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_north", "PATROL", 5, ["zone_factory_patrol_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_patrol_north", "PATROL", 6, ["zone_factory_patrol_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_north", "PATROL", 3, ["zone_factory_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_north", "PATROL", 3, ["zone_factory_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_south", "PATROL", 3, ["zone_factory_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_south", "PATROL", 3, ["zone_factory_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_factory_north", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_north", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_factory_south", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 8: {

        // Factory reinforcements

        // _handle = ["spawn_factory_helo", "VEHICLE", 12, ["factory_helo_dropoff", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["point_reinf_factory_w", "VEHICLE", 10, ["factory_vic_waypoint", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["point_reinf_factory_e", "VEHICLE", 11, ["factory_vic_waypoint", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 30;

        _handle = ["zone_reinf_factory_e", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 30;

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        // _handle = ["spawn_factory_helo", "VEHICLE", 12, ["factory_helo_dropoff", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 9: {

        // Last stand
		{
			if (side _x == opfor) then
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

    };
};

phase = _nbr;
publicVariable "phase";
["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
