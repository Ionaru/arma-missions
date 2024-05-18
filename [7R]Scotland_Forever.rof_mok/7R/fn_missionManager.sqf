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

// Phase Case means Phase
switch (_nbr) do {
	// Phase 1 - Initial
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
		} forEach [b1, b2];

		_handle = ["highlander_patrol", "PATROL", 2, ["highlander_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["highlander_patrol", "PATROL", 2, ["highlander_patrol", "P"]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};
		_handle = ["highlander_base", "GARRISON", 2, [300]] spawn fw_fnc_spawnTemplate; waitUntil {scriptDone _handle};

		"Mission Loaded" remoteExec ["systemChat", 0];
	};
    case 1: {

	};
	case 2: {

	};
	case 3: {

	};
};

phase = _nbr;
publicVariable "phase";
["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
