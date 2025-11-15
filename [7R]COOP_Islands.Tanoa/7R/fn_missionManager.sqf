/*
parameters:
<-- Phase Number as integer

Description:
modify and add unit spawn template code per phase.

You can also use it to spawn counter attacks, just handle them as a Phase.
Add further case in the switch-do-loop.

Make Phase Variable an integer. On trigger Act. use instead of phase = true;
phase = phase + 1 or phase = 2.

Example:
nul = [0] spawn fw_fnc_missionManager;

*/

// Server only execute or HC if present
if (!isServer && hasinterface) exitwith {};
if (!isnil "HC" && isServer) exitwith {};

// parameter init
params ["_nbr"];

_civilians = [
    "C_Man_casual_1_F_tanoan",
    "C_Man_casual_2_F_tanoan",
    "C_Man_casual_3_F_tanoan",
    "C_Man_casual_4_F_tanoan",
    "C_Man_casual_4_v2_F_tanoan",
    "C_Man_casual_5_F_tanoan",
    "C_Man_casual_5_v2_F_tanoan",
    "C_Man_casual_6_F_tanoan",
    "C_Man_casual_6_v2_F_tanoan",
    "C_Man_casual_7_F_tanoan",
    "C_Man_casual_8_F_tanoan",
    "C_Man_casual_9_F_tanoan",
    "C_Man_UtilityWorker_01_F"
];

// Phase case means Phase
switch (_nbr) do {
    // Phase 0 - init
    case 0: {
        "loading Mission" remoteExec ["systemChat", 0];

        SR_Hack = [hack1, hack2, hack3];
        publicVariable "SR_Hack";

        _handle = ["init_patrol_1", "PATROL", 3, ["init_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["init_patrol_1", "PATROL", 1, ["init_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["init_patrol_1", "GARRISON", 3, [400]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["init_patrol_2", "PATROL", 3, ["init_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["init_patrol_2", "PATROL", 1, ["init_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_civ_1", _civilians, 3, 0, 0, 1] spawn fw_fnc_civspawn;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_civ_2", _civilians, 5, 0, 0, 2] spawn fw_fnc_civspawn;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_civ_3", _civilians, 0, 0, 0, 3] spawn fw_fnc_civspawn;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_patrol_1", "PATROL", 2, ["ammo_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_patrol_1", "PATROL", 3, ["ammo_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_patrol_1", "PATROL", 4, ["ammo_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_base", "GARRISON", 3, [100]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_base", "PATROL", 3, ["ammo_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        "Mission loaded" remoteExec ["systemChat", 0];
    };
    // Phase 1 - ammo reinf
    case 1: {
        _handle = ["comms_vic_spawn", "vehicle", 10, ["ammo_vic_wp", false, ["ammo_patrol_1", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_1", "PATROL", 1, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_2", "PATROL", 3, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_2", "PATROL", 4, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 2 - ammo reinf (again)
    case 2: {
        _handle = ["comms_vic_spawn", "vehicle", 11, ["ammo_patrol_1", false, ["ammo_patrol_1", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_1", "PATROL", 3, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_1", "PATROL", 4, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["ammo_reinf_2", "PATROL", 1, ["ammo_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 3 - ammo rampage, Comms init
    case 3: {
        [t_ammo_rampage] spawn fw_fnc_rampageArea;
        _handle = ["comms_patrol_1", _civilians, 5, 0, 0, 1] spawn fw_fnc_civspawn;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_1", "PATROL", 2, ["comms_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_1", "PATROL", 3, ["comms_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_1", "GARRISON", 1, [400]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_2", "PATROL", 1, ["comms_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_3", "PATROL", 2, ["comms_patrol_3", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_patrol_4", "PATROL", 1, ["comms_patrol_4", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 4 - Comms reinf
    case 4: {
        _handle = ["comms_reinf_1", "PATROL", 1, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_2", "PATROL", 1, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_3", "PATROL", 3, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_3", "PATROL", 3, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_4", "PATROL", 2, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 5 - hack1 reinf
    case 5: {
        _handle = ["island1_vic_spawn", "vehicle", 10, ["comms_vic_wp", false, ["comms_patrol_4", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_1", "PATROL", 1, ["comms_patrol_1", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["comms_reinf_2", "PATROL", 1, ["comms_patrol_4", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_patrol_1", "PATROL", 1, ["depot_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_patrol_2", "PATROL", 1, ["depot_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_base", "GARRISON", 1, [400]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 6 - depot reinf
    case 6: {
        _handle = ["depot_reinf_1", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_1", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_2", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_2", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_3", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_3", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_4", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["depot_reinf_4", "PATROL", 6, ["depot_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 7 - depot rampage
    case 7: {
        [t_depot_rampage] spawn fw_fnc_rampageArea;
        _handle = ["airstrip_vic_spawn", "AIR", 21, ["depot_base", "SAD", "AWARE"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_1", "PATROL", 1, ["island_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_1", "PATROL", 3, ["island_patrol_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_2", "PATROL", 3, ["island_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_2", "PATROL", 7, ["island_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_2", "PATROL", 7, ["island_patrol_2", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_3", "PATROL", 1, ["island_patrol_3", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };

        _handle = ["port_civ_1", _civilians, 10, 0, 0, 5] spawn fw_fnc_civspawn;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_base", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_civ_1", "PATROL", 7, ["port_civ_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_civ_1", "PATROL", 7, ["port_civ_1", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 8 - port reinf
    case 8: {
        _handle = ["port_reinf_3", "PATROL", 1, ["port_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_reinf_2", "PATROL", 1, ["port_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_reinf_3", "PATROL", 1, ["port_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["port_reinf_1", "vehicle", 10, ["port_vic_wp", false, ["port_base", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_reinf_2", "vehicle", 12, ["port_base", false, ["port_base", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_reinf_1", "vehicle", 13, ["port_base", false, ["port_base", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 9 - port rampage
    case 9: {
        [t_port_rampage] spawn fw_fnc_rampageArea;
        _handle = ["island_patrol_4", "PATROL", 1, ["island_patrol_4", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_4", "PATROL", 1, ["island_patrol_4", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_base", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_base", "PATROL", 1, ["fuel_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 10 - fuel reinf
    case 10: {
        _handle = ["fuel_reinf_1", "PATROL", 1, ["fuel_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_reinf_1", "PATROL", 2, ["fuel_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_reinf_2", "PATROL", 1, ["fuel_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["fuel_reinf_2", "PATROL", 2, ["fuel_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_5", "PATROL", 1, ["island_patrol_5", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_5", "PATROL", 7, ["island_patrol_5", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["island_patrol_5", "PATROL", 7, ["island_patrol_5", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_base", "PATROL", 2, ["hack_2_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_base", "PATROL", 2, ["hack_2_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 11 - hack2 reinf
    case 11: {
        _handle = ["airstrip_vic_spawn", "AIR", 20, ["depot_base", "SAD", "AWARE"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_reinf_2", "PATROL", 6, ["hack_2_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_reinf_2", "PATROL", 5, ["hack_2_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_reinf_2", "PATROL", 4, ["hack_2_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_2_reinf_2", "PATROL", 3, ["hack_2_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_base", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_base", "PATROL", 7, ["hack_3_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_base", "PATROL", 7, ["hack_3_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 12 - hack3 reinf
    case 12: {
        _handle = ["hack_3_reinf_1", "PATROL", 1, ["hack_3_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_reinf_1", "PATROL", 2, ["hack_3_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_reinf_2", "PATROL", 1, ["hack_3_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["hack_3_reinf_2", "PATROL", 2, ["hack_3_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "GARRISON", 1, [0]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 7, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 7, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 7, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 7, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 2, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_base", "PATROL", 2, ["air_base", "P"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 13 - air reinf
    case 13: {
        _handle = ["air_reinf_1", "vehicle", 13, ["air_base", false, ["air_base", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_2", "vehicle", 13, ["air_base", false, ["air_base", "RP"]]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_3", "PATROL", 7, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_3", "PATROL", 7, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_3", "PATROL", 1, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_4", "PATROL", 7, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_4", "PATROL", 7, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
        _handle = ["air_reinf_4", "PATROL", 1, ["air_base", "RP"]] spawn fw_fnc_spawnTemplate;
        waitUntil {
            scriptDone _handle
        };
    };
    // Phase 14 air rampage
    case 14: {
        [t_air_rampage] spawn fw_fnc_rampageArea;
    };
    // Phase 99 - finish
    case 99: {
        {
            if (side _x == opfor || side _x == independent) then {
                _x setDamage 1
            }
        } forEach allunits;
        [] call fw_fnc_debrief;
    };
};

phase = _nbr;
publicVariable "phase";
["Missionlog", ["Mission", ("case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
