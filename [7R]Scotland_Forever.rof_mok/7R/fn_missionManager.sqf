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

{
	_x setObjectTextureGlobal [0, "uniform_scot.paa"];
} forEach units group base_defence;

_civs = ["C_man_polo_4_F_euro", "C_man_polo_3_F_euro", "C_man_polo_2_F_euro", "C_Man_casual_1_F_euro", "C_Man_casual_2_F_euro"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1 - Initial (Highlander spawn)
    case 1: {
		"Loading Mission" remoteExec ["systemChat", 0];

		// Move enemy BAF units to East
		{
			_group = group _x;
			_newGroup = createGroup [east, true];
			_leader = leader _group;
			_units = units _group;
			_units joinSilent _newGroup;
			_newGroup selectLeader _leader;
		} forEach [b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11];

		_handle = ["highlander_patrol", "PATROL", 2, ["highlander_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["highlander_patrol", "PATROL", 2, ["highlander_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["highlander_base", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		"Mission Loaded" remoteExec ["systemChat", 0];
	};
  // Phase 2 - Highlander Reinf
	case 2: {
    _handle = ["highlander_reinf1", "PATROL", 2, ["highlander_base", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["highlander_reinf2", "PATROL", 1, ["highlander_base", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 30;

    _handle = ["highlander_reinf3", "PATROL", 2, ["highlander_base", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["highlander_reinf3", "PATROL", 2, ["highlander_base", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};
  // Phase 3 - Barracks populate
	case 3: {

    "fob_highlander" setMarkerColor "ColorGreen";

    _handle = ["barracks_garrison_1", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_garrison_1", "GARRISON", 1, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["barracks_patrol_1", "PATROL", 2, ["barracks_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_patrol_1", "PATROL", 5, ["barracks_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_patrol_2", "PATROL", 2, ["barracks_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_patrol_2", "PATROL", 5, ["barracks_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_patrol_3", "PATROL", 2, ["barracks_patrol_3", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_patrol_3", "PATROL", 5, ["barracks_patrol_3", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["barracks_garrison_1", "PATROL", 6, ["barracks_garrison_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_garrison_1", "PATROL", 6, ["barracks_garrison_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_garrison_1", "PATROL", 7, ["barracks_garrison_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_garrison_1", "PATROL", 7, ["barracks_garrison_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
	};
  // Phase 4 - Barracks reinf
  case 4: {
    _handle = ["barracks_reinf_1", "PATROL", 2, ["barracks_patrol_2", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["boat_spawn", "VEHICLE", 12, ["barracks_boat_east", false, ["barracks_boat_east", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    sleep 60;
    _handle = ["barracks_reinf_1", "PATROL", 2, ["barracks_patrol_2", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["campbeltown_patrol", "PATROL", 1, ["barracks_patrol_2", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["boat_spawn", "VEHICLE", 13, ["barracks_boat_west", false, ["barracks_boat_west", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["barracks_reinf_vic", "VEHICLE", 102, ["barracks_patrol_2", false, ["barracks_patrol_3", "R"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 5 - Depot patrol
  case 5: {
    _handle = ["depot_patrol", "PATROL", 7, ["depot_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_patrol", "PATROL", 7, ["depot_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_patrol", "PATROL", 7, ["depot_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_patrol", "PATROL", 6, ["depot_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_patrol", "PATROL", 6, ["depot_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 6 - Depot reinf
  case 6: {
    _handle = ["depot_reinf_1", "PATROL", 1, ["depot_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_reinf_1", "PATROL", 2, ["depot_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_1", "PATROL", 100, ["depot_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };

    // Phase 7 - Factory patrol
  case 7: {
    _handle = ["factory_patrol", "PATROL", 1, ["factory_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["campbeltown_patrol", "PATROL", 7, ["campbeltown_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_patrol", "PATROL", 100, ["factory_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_patrol", "PATROL", 101, ["factory_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_garrison", "GARRISON", 7, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    ["Campbeltown_Civ_1",_civs,7] spawn fw_fnc_civSpawn;
    ["Campbeltown_Civ_2",_civs,8] spawn fw_fnc_civSpawn;
    ["factory_garrison",_civs,5] spawn fw_fnc_civSpawn;
  };
  // Phase 8 - Factory reinf
  case 8: {
    _handle = ["factory_reinf_1", "PATROL", 101, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_2", "PATROL", 100, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["boat_spawn", "VEHICLE", 12, ["campbeltown_boat_north", false, ["campbeltown_boat_north", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    sleep 120;
    _handle = ["boat_spawn", "VEHICLE", 12, ["campbeltown_boat_south", false, ["campbeltown_boat_south", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_1", "PATROL", 101, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_2", "PATROL", 100, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
    // Phase 9 - Radar patrol
  case 9: {
    _handle = ["radar_patrol", "PATROL", 2, ["radar_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["radar_patrol", "PATROL", 2, ["radar_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["radar_patrol", "PATROL", 7, ["radar_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["radar_garisson", "GARRISON", 7, [100]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
    // Phase 10 - Radar reinf
  case 10: {
    _handle = ["radar_reinf_1", "PATROL", 1, ["radar_garisson", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["radar_reinf_2", "PATROL", 2, ["radar_garisson", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_2", "PATROL", 100, ["radar_garisson", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 11 - Depot secure
  case 11: {
    "depot" setMarkerColor "ColorGreen";
    _handle = ["radar_reinf_2", "PATROL", 7, ["depot_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["radar_reinf_2", "PATROL", 7, ["depot_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 12 - Factory secure
  case 12: {
    "factory" setMarkerColor "ColorGreen";
    _handle = ["factory_reinf_1", "PATROL", 6, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_1", "PATROL", 7, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_2", "PATROL", 6, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["factory_reinf_2", "PATROL", 7, ["factory_garrison", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 13 - Radar secure
  case 13: {
    "radar" setMarkerColor "ColorGreen";
    _handle = ["depot_reinf_1", "PATROL", 7, ["radar_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["depot_reinf_1", "PATROL", 7, ["radar_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 14 - Airfield patrol
  case 14: {
    _handle = ["airfield_edge_east", "PATROL", 100, ["airfield_edge_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_edge_east", "PATROL", 7, ["airfield_edge_east", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_edge_north", "PATROL", 1, ["airfield_edge_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_edge_north", "PATROL", 7, ["airfield_edge_north", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_edge_south", "PATROL", 2, ["airfield_edge_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_edge_south", "PATROL", 7, ["airfield_edge_south", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_patrol_1", "PATROL", 6, ["airfield_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_patrol_1", "PATROL", 6, ["airfield_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_patrol_1", "PATROL", 7, ["airfield_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_patrol_1", "PATROL", 7, ["airfield_patrol_1", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_patrol_2", "PATROL", 1, ["airfield_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_patrol_2", "PATROL", 1, ["airfield_patrol_2", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_patrol_3", "PATROL", 1, ["airfield_patrol_3", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_patrol_3", "PATROL", 1, ["airfield_patrol_3", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["primary_storage_patrol", "PATROL", 100, ["primary_storage_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["ancillary_storage_patrol", "PATROL", 100, ["ancillary_storage_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    sleep 900;

    _handle = ["logistics_patrol", "GARRISON", 100, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["logistics_patrol", "GARRISON", 100, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["logistics_patrol", "PATROL", 100, ["logistics_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_admin", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_admin", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_admin", "PATROL", 6, ["airfield_admin", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_admin", "PATROL", 6, ["airfield_admin", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_admin", "PATROL", 6, ["airfield_admin", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["airfield_barracks_patrol", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["logistics_patrol", "PATROL", 1, ["logistics_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

    _handle = ["housing_patrol", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["logistics_patrol", "PATROL", 1, ["logistics_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 15 - Airfield reinf east
  case 15: {
    // airfield_reinf_south_1
    _handle = ["airfield_reinf_south_1", "PATROL", 1, ["airfield_patrol_2", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf_north_1", "PATROL", 1, ["airfield_patrol_2", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    // airfield_reinf_north_1
    // airfield_vic_spawn_north
    _handle = ["airfield_vic_spawn_north", "VEHICLE", 11, ["airfield_patrol_2", false, ["airfield_patrol_2", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    sleep 20;
    _handle = ["airfield_vic_spawn_north", "VEHICLE", 10, ["airfield_patrol_2", false, ["airfield_patrol_2", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 16 - Airfield reinf south
  case 16: {
    _handle = ["airfield_reinf_south_1", "PATROL", 100, ["logistics_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf_south_2", "PATROL", 101, ["logistics_patrol", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_vic_spawn_south", "VEHICLE", 8, ["logistics_patrol", false, ["logistics_patrol", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    sleep 20;
    _handle = ["airfield_vic_spawn_south", "VEHICLE", 10, ["logistics_patrol", false, ["logistics_patrol", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  // Phase 17 - Airfield reinf north
  case 17: {
    _handle = ["airfield_reinf_north_1", "PATROL", 2, ["airfield_patrol_1", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_reinf_north_2", "PATROL", 2, ["airfield_patrol_1", "R"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
    _handle = ["airfield_vic_spawn_north", "VEHICLE", 8, ["airfield_patrol_1", false, ["airfield_patrol_1", "P"]]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
  };
  case 18: {};
  case 19: {};
  case 20: {};
  case 21: {};
  case 22: {};

  // Phase 99 - End
  case 99: {};
};

phase = _nbr;
publicVariable "phase";
["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
