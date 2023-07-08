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

        case 5: {
        "Loading Mission" remoteExec ["systemChat", 0];

        _handle = ["base_reinf_ne", "PATROL", 1, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_n", "PATROL", 1, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_vic_spawn", "VEHICLE", 11, ["base_dropoff", false, ["base_zone", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        "Mission Loaded" remoteExec ["systemChat", 0];

        sleep 15;

        _handle = ["base_reinf_ne", "PATROL", 3, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_n", "PATROL", 3, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_se", "PATROL", 3, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 30;

        _handle = ["base_reinf_ne", "PATROL", 6, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_n", "PATROL", 6, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["base_reinf_se", "PATROL", 1, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_ne", "PATROL", 1, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["base_reinf_n", "PATROL", 1, ["base_zone", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 6: {
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
    };

    case 8: {

        // Factory reinforcements

        _handle = ["spawn_factory_helo", "VEHICLE", 12, ["factory_helo_dropoff", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["point_reinf_factory_w", "VEHICLE", 10, ["factory_vic_waypoint", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["point_reinf_factory_e", "VEHICLE", 11, ["factory_vic_waypoint", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_reinf_factory_e", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 3, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 30;

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 60;

        _handle = ["zone_reinf_factory_e", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_w", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["zone_reinf_factory_n", "PATROL", 1, ["zone_factory_north", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["spawn_factory_helo", "VEHICLE", 12, ["factory_helo_dropoff", false, ["zone_factory_north", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 9: {

        // Airbase patrols

        _handle = ["road_patrol", "PATROL", 5, ["road_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["road_patrol", "PATROL", 6, ["road_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["road_patrol", "PATROL", 7, ["road_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["road_patrol_2", "PATROL", 5, ["road_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["road_patrol_2", "PATROL", 6, ["road_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["road_patrol_2", "PATROL", 7, ["road_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        _handle = ["airbase_runway_patrol", "PATROL", 1, ["airbase_runway_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_runway_patrol", "PATROL", 1, ["airbase_runway_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_runway_patrol", "PATROL", 1, ["airbase_runway_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_ramp_patrol", "PATROL", 3, ["airbase_gate_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_ramp_patrol", "PATROL", 3, ["airbase_gate_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_ramp_patrol", "PATROL", 3, ["airbase_ramp_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_ramp_patrol", "PATROL", 3, ["airbase_ramp_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_gate_patrol", "GARRISON", 3, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    };

        case 10: {

        // Airbase reinforcements

        _handle = ["airbase_helo_start", "VEHICLE", 12, ["airbase_helo_dropoff_nw", false, ["airbase_ramp_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_vic_spawn_nw", "VEHICLE", 9, ["airbase_vic_target", false, ["airbase_ramp_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_vic_spawn_se", "VEHICLE", 9, ["airbase_vic_target", false, ["airbase_ramp_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_reinf_e", "PATROL", 1, ["airbase_reinf_e", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 120;

        _handle = ["airbase_helo_start", "VEHICLE", 12, ["airbase_helo_dropoff_ne", false, ["airbase_ramp_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_reinf_e", "PATROL", 1, ["airbase_reinf_e", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 11: {

        // Stadium patrols

        _handle = ["airbase_vic_spawn_nw", "VEHICLE", 12, ["stadium_helo_dropoff", false, ["airbase_ramp_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_patrol", "PATROL", 1, ["stadium_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_patrol_outer", "PATROL", 1, ["stadium_patrol_outer", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_patrol_outer", "PATROL", 1, ["stadium_patrol_outer", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_patrol", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 12: {

        // Stadium reinforcements

        _handle = ["stadium_reinf_ne", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_e", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_se", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_vic_spawn_se", "VEHICLE", 11, ["stadium_dropoff", false, ["stadium_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 120;

        _handle = ["stadium_reinf_ne", "PATROL", 3, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_e", "PATROL", 3, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_se", "PATROL", 3, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["airbase_vic_spawn_se", "VEHICLE", 10, ["stadium_dropoff", false, ["stadium_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

        sleep 30;

        _handle = ["stadium_reinf_ne", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_e", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_se", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    };

    case 50: {

        _handle = ["stadium_reinf_ne", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_e", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
        _handle = ["stadium_reinf_se", "PATROL", 1, ["stadium_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

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
