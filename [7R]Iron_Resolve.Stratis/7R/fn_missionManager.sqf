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

_civs = ["C_Man_casual_1_F","C_Man_casual_3_F","C_man_sport_2_F","C_man_polo_3_F","C_Man_ConstructionWorker_01_Red_F"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Rogain Garrison
  case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];

    ["civ_house_1", _civs, 1] spawn fw_fnc_civSpawn;

    _handle = ["vic_spawn", "VEHICLE", 10, ["vic_wp", false, ["rogain_garrison", "P"]]] spawn fw_fnc_spawnTemplate;

    _handle = ["rogain_garrison", "GARRISON", 1, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["rogain_patrol", "PATROL", 1, ["rogain_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["rogain_patrol", "PATROL", 2, ["rogain_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["rogain_patrol", "PATROL", 2, ["rogain_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["rogain_patrol", "PATROL", 3, ["rogain_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["rogain_patrol", "PATROL", 3, ["rogain_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		"Mission Loaded" remoteExec ["systemChat", 0];

	};
  // Phase 1 - Rogain reinforcement
  case 1: {

      _handle = ["rogain_reinf_1", "PATROL", 1, ["rogain_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
      _handle = ["rogain_reinf_2", "PATROL", 1, ["rogain_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
      _handle = ["vic_spawn", "VEHICLE", 11, ["vic_wp", false, ["rogain_garrison", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

      sleep 200;

      _handle = ["rogain_reinf_1", "PATROL", 1, ["rogain_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
      _handle = ["rogain_reinf_3", "PATROL", 1, ["rogain_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};
  // Phase 2 - Rogain secure, populate tower 1
	case 2: {

    _handle = ["tower_1_patrol", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_1_patrol", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 120;

    _handle = ["tower_1_reinf_3", "PATROL", 2, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_1_reinf_3", "PATROL", 3, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_1_reinf", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

	};
  // Phase 3 - Tower 1 counter
	case 3: {
    _handle = ["tower_1_reinf_3", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 30;

    _handle = ["tower_1_reinf", "PATROL", 2, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_1_reinf", "PATROL", 2, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 60;

    _handle = ["tower_1_reinf_2", "PATROL", 2, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_1_reinf_2", "PATROL", 2, ["tower_1_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};
  // Phase 4 - Tower 1 destroyed, Populate Mike-26
	case 4: {
    _handle = ["valley_counter", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["outpost_garrison", "PATROL", 1, ["tower_1_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["outpost_garrison", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["outpost_garrison", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_vic_spawn", "VEHICLE", 11, ["mike26_rally", false, ["mike26_rally", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    ["civ_house_2", _civs, 2] spawn fw_fnc_civSpawn;
    _handle = ["mike26_garrison", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_garrison", "GARRISON", 3, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_garrison", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_garrison", "PATROL", 1, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_garrison", "PATROL", 2, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_garrison", "PATROL", 5, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};
  // Phase 5 - Mike-26 counterattack
  case 5: {
    _handle = ["mike26_reinf_1", "PATROL", 5, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_reinf_2", "PATROL", 1, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["valley_counter", "PATROL", 1, ["mike26_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_vic_spawn", "VEHICLE", 10, ["mike26_garrison", false, ["tower_2_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    sleep 60;
    _handle = ["mike26_reinf_2", "PATROL", 1, ["mike26_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_vic_spawn", "VEHICLE", 12, ["mike26_rally", false, ["mike26_rally", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 6 - Mike-26 counterattack 2
  case 6: {
    _handle = ["mike26_reinf_2", "PATROL", 5, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_reinf_2", "PATROL", 1, ["mike26_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_reinf_3", "PATROL", 5, ["mike26_garrison", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["mike26_reinf_3", "PATROL", 1, ["mike26_garrison", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 7 - Tower 2 populate
  case 7: {
    _handle = ["range_reinf_3", "PATROL", 1, ["tower_2_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_patrol", "PATROL", 4, ["tower_2_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_vic_spawn", "VEHICLE", 11, ["tower_2_patrol", false, ["tower_2_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 8 - Tower 2 counter
  case 8: {
    _handle = ["tower_2_reinf", "PATROL", 5, ["tower_2_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_reinf", "PATROL", 5, ["tower_2_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 1, ["tower_2_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_rally", "PATROL", 1, ["tower_2_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 9 - Populate Range
  case 9: {
    ["town_civs", _civs, 15] spawn fw_fnc_civSpawn;
    ["civ_house_3", _civs, 2] spawn fw_fnc_civSpawn;
    _handle = ["range_patrol", "PATROL", 2, ["range_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_patrol", "PATROL", 2, ["range_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_patrol", "PATROL", 3, ["range_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_patrol", "PATROL", 4, ["range_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_rally", "VEHICLE", 12, ["range_patrol", false, ["range_patrol", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_patrol", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 1, ["tower_2_patrol", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["town_civs", "PATROL", 1, ["town_civs", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 10 - Nothing
  case 10: {};
  // Phase 11 - Range counter
  case 11: {
    _handle = ["range_reinf", "PATROL", 1, ["range_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf", "PATROL", 3, ["range_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_2", "PATROL", 1, ["range_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_2", "PATROL", 3, ["range_rally", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_vic_reinf_spawn_3", "VEHICLE", 11, ["range_patrol", false, ["range_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_vic_spawn", "VEHICLE", 10, ["range_patrol", false, ["range_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_vic_reinf_spawn_1", "VEHICLE", 10, ["range_patrol", false, ["range_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 60;

    _handle = ["range_vic_reinf_spawn_1", "VEHICLE", 11, ["range_patrol", false, ["range_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_vic_reinf_spawn_2", "VEHICLE", 10, ["range_patrol", true, ["range_patrol", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_2", "PATROL", 4, ["range_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 4, ["range_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_3_reinf_1", "PATROL", 1, ["range_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 12 - Tower 3 counter
  case 12: {
    _handle = ["tower_3_reinf_1", "PATROL", 5, ["tower3_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_3_reinf_1", "PATROL", 5, ["tower3_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 5, ["tower3_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 5, ["tower3_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 13 - Tower 3 counter 2
  case 13: {
    _handle = ["range_reinf_3", "PATROL", 4, ["tower3_rally", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["range_reinf_3", "PATROL", 6, ["airfield_spotter", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["boat_spawn_1", "VEHICLE", 13, ["marina_boat_rally", false, ["marina_boat_rally", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 14 - Populate airfield
  case 14: {
    _handle = ["airfield_spotter", "PATROL", 6, ["airfield_spotter", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["boat_spawn_1", "VEHICLE", 13, ["airfield_boat_rally", false, ["airfield_boat_rally", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_1", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_1", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_1", "GARRISON", 5, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_1", "PATROL", 4, ["airfield_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_2", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_2", "PATROL", 4, ["airfield_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_3", "GARRISON", 3, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_3", "GARRISON", 3, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_3", "PATROL", 4, ["airfield_3", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_4", "GARRISON", 4, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_4", "PATROL", 2, ["airfield_4", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_4", "PATROL", 2, ["airfield_4", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_5", "GARRISON", 5, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_5", "PATROL", 3, ["airfield_5", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_5", "PATROL", 3, ["airfield_5", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 15 - Airfield counter
  case 15: {
    _handle = ["boat_spawn_2", "VEHICLE", 13, ["airfield_boat_rally_2", false, ["airfield_boat_rally", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_vic_spawn", "VEHICLE", 12, ["airfield_1", false, ["airfield_1", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_vic_spawn_2", "VEHICLE", 11, ["airfield_1", true, ["airfield_1", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 4, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 4, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["tower_2_vic_spawn", "VEHICLE", 12, ["airfield_2", false, ["airfield_2", "RP"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 120;

    _handle = ["airfield_reinf", "PATROL", 4, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 4, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 60;

    _handle = ["airfield_reinf", "PATROL", 5, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 5, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 16 - Extract counter
  case 16: {
    _handle = ["airfield_reinf", "PATROL", 2, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 2, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 2, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 2, ["airfield_2", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf", "PATROL", 6, ["airfield_spotter", "RP"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 99 - Finish
  case 99: {
    [] call fw_fnc_debrief;
  };
};

phase = _nbr;
publicVariable "phase";
["MissionLog", ["Mission", ("Phase " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
