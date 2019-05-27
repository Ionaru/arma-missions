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
params["_nbr"];

// Phase Case means Phase
switch (_nbr) do {

    case 1: {

        // Start

        // Civvies

        _civs = [
            "LOP_CHR_Civ_Woodlander_02",
            "LOP_CHR_Civ_Woodlander_03",
            "LOP_CHR_Civ_Woodlander_04",
            "LOP_CHR_Civ_Citizen_04",
            "LOP_CHR_Civ_Functionary_02",
            "LOP_CHR_Civ_Profiteer_01",
            "LOP_CHR_Civ_Profiteer_02",
            "LOP_CHR_Civ_Profiteer_03",
            "LOP_CHR_Civ_Profiteer_04",
            "LOP_CHR_Civ_Villager_01",
            "LOP_CHR_Civ_Villager_02",
            "LOP_CHR_Civ_Villager_03"
        ];

        _handle = ["town_attack_area", _civs ,36] spawn fw_fnc_civSpawn;
        waitUntil {
            scriptDone _handle
        };

        // Enemies

        _handle = ["base1_spawn_front", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_front", "PATROL", 5, ["base1_front_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        // Base #1 middle
        _handle = ["base1_spawn_middle", "PATROL", 5, ["base1_middle", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 5, ["base1_middle", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 4, ["base1_middle", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        // Base #1 back
        _handle = ["base1_spawn_back", "PATROL", 1, ["base1_back", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_back", "PATROL", 7, ["base1_back", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_back", "PATROL", 1, ["base1_back", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_back", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        // Patrol base 1
        _handle = ["base1_spawn_middle", "PATROL", 4, ["west_base_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 3, ["west_base_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 1, ["west_base_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 7, ["west_base_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["base1_spawn_middle", "PATROL", 2, ["west_base_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    case 2: {

        // Counterattack

        _counter_vehicle_points = ["assault_spawn_vehicle_1", "assault_spawn_vehicle_2"];
        _counter_spawn_points = ["spawn_assault_1", "spawn_assault_2", "spawn_assault_3", "spawn_assault_4", "spawn_assault_5"];
        _counter_forces_infantry = [1, 2, 3, 4, 7];
        _counter_forces_vehicle = [8, 9, 12, 13];

        for "_i" from 1 to 2 do {

            for "_j" from 1 to 5 do {
                _handle = [selectRandom _counter_spawn_points, "PATROL", selectRandom _counter_forces_infantry, ["town_attack_area", "R"]] spawn fw_fnc_spawnTemplate;
                waitUntil {
                    scriptDone _handle
                };

                sleep 5;
            };

            // RAMPAGE!!
            _handle = [selectRandom _counter_spawn_points, "PATROL", selectRandom _counter_forces_infantry, ["town_attack_area", "RP"]] spawn fw_fnc_spawnTemplate;
            waitUntil {
                scriptDone _handle
            };

            sleep 240;

            //vehicles

            _handle = [selectRandom _counter_vehicle_points, "VEHICLE", selectRandom _counter_forces_vehicle, ["town_attack_waypoint", false, ["town_attack_area", "R"]]] spawn fw_fnc_spawnTemplate;
            waitUntil {
                scriptDone _handle
            };

            sleep 20;

            _handle = [selectRandom _counter_vehicle_points, "VEHICLE", selectRandom _counter_forces_vehicle, ["town_attack_waypoint", false, ["town_attack_area", "R"]]] spawn fw_fnc_spawnTemplate;
            waitUntil {
                scriptDone _handle
            };

            sleep 240;
        };

        sleep 60;

        counter = true;
        publicVariable "counter";

    };
    case 3: {

        // House

        _handle = ["house_spawn", "PATROL", 4, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 5, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 5, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 6, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 6, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 6, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
                sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["house_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
        _handle = ["house_spawn", "GARRISON", 3, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["south_road_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["south_road_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        sleep 2;
        _handle = ["house_spawn", "PATROL", 1, ["south_road_patrol", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

    };
    case 4: {

        // Base

        _handle = ["base_spawn", "GARRISON", 2, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "GARRISON", 3, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "GARRISON", 4, [150]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 4, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 1, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 3, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 1, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 2, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;

        _handle = ["base_spawn", "PATROL", 3, ["base_patrol_area", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        sleep 2;
    };
    case 5: {
        // Base reinforcements

        _base_counter_spawns = ["base_reinforce_1", "base_reinforce_2"];

        for "_x" from 1 to 5 do {
            _handle = [selectRandom _counter_spawn_points, "PATROL", 1, ["base_reinforce_area", "R"]] spawn fw_fnc_spawnTemplate;
            waitUntil {
                scriptDone _handle
            };

            sleep 5;
        };

        _handle = ["base_vehicle_spawn", "VEHICLE", 14, ["base_spawn", false, ["base_reinforce_area", "R"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        sleep 10;

        _handle = ["base_vehicle_spawn", "VEHICLE", 14, ["base_spawn", false, ["base_reinforce_area", "R"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
};
