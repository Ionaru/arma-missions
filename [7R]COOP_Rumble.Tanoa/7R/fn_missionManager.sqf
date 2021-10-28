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


	- Move through CSAT territory, they will not engage (ordered to let them pass).
	- Move through rebel territory, firefights
	- Arrive in LA Rochelle, evactuate people to the airport
	- Check report of device in CSAT quarry, get sent to administration building for intel.
	- Device is causing the eruption, destroy it.

	[Intro_BoatSaviour,[1,"Quick, get in."]] remoteExec ["customChat", -2, false];

*/

_OBJ = GameLogicOne;
_ps1 = "#particlesource" createVehicleLocal getpos _OBJ;
_ps2 = "#particlesource" createVehicleLocal getpos _OBJ;

_ps1 setParticleCircle [0, [0, 0, 0]];
_ps1 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps1 setParticleParams [["\ca\data\particleeffects\fireandsmokeanim\smokeanim.p3d", 8, 1, 6], "", "billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.2, 0.2, 0.2, 0.3], [0.35, 0.35, 0.35, 0.2], [0.5, 0.5, 0.5, 0]], [0.125], 1, 0, "", "", _OBJ];
_ps1 setDropInterval 0.2;

_ps2 setParticleCircle [0, [0, 0, 0]];
_ps2 setParticleRandom [0, [0.4, 0.4, 0], [0.4, 0.4, 0], 0, 0.25, [0, 0, 0, 0.1], 0, 0];
_ps2 setParticleParams [["\ca\data\particleeffects\fireandsmokeanim\smokeanim.p3d", 8, 3, 1], "", "billboard", 1, 8, [0, 0, 0], [0, 0, 4.5], 0, 10, 7.9, 0.5, [4, 12, 20], [[0.33, 0.33, 0.33, 0.8], [0.66, 0.66, 0.66, 0.4], [1, 1, 1, 0]], [0.125], 1, 0, "", "", _OBJ];
_ps2 setDropInterval 0.2;

// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

// Parameter init
params ["_nbr"];

// Phase Case means Phase
switch (_nbr) do {
	// Phase 0 - Initial
    case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];


		for "_i" from 1 to 4 do {
			_handle = ["a1","PATROL",7,["a1","P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		};

		{
			_handle = [_x,"GARRISON",1,[5,1]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["b1","b2"];


		_handle = ["o1","GARRISON",1,[150]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["o2","ZEI",1] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["a2",["LOP_CHR_Civ_Random"], 10,0] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};
		_handle = ["vs1","VEHICLE",9,["is1",false,["a1","R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		phase = 0;
		publicVariable "phase";

		"Mission Loaded" remoteExec ["systemChat", 0];

	};
    case 1: {

	};
	case 2: {

	};
	case 3: {

	};
};

["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
