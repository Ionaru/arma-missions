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

// Name, unit count, template number.
_rifle8 = 1;
_ar4 = 2;
_at2 = 3;
_marksman4 = 4;
_sniper2 = 5;
_shotgun2 = 6;
_truck9 = 7;
_carPkm = 8;
_carDshkm = 9;
_special4 = 11;

_civs = [
	"C_Man_1_enoch_F",
	"C_Man_2_enoch_F",
	"C_Man_3_enoch_F",
	"C_Man_4_enoch_F",
	"C_Man_5_enoch_F",
	"C_Man_6_enoch_F",
	"C_Farmer_01_enoch_F"
];

phase = _nbr;
publicVariable "phase";

// Phase Case means Phase
switch (_nbr) do {
    case 0: { // Populate roadblock
		"Loading Mission" remoteExec ["systemChat", 0];

		[ 
			[ 
				["Hellanmaa, Finland", "<t align = 'center' shadow = '1' size = '0.7'>%1</t><br/>", 6],
				["Operation Last Transmission", "<t align = 'center' shadow = '1' size = '0.7' font='PuristaBold'>%1</t><br/>", 6],
				["By Ionaru", "<t align = 'center' shadow = '1' size = '0.5'>%1</t>", 60]
			] 
		] remoteExec ["BIS_fnc_typeText", 0];

		{
			_handle = [_x, "PATROL", _rifle8, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_roadblock_west", "patrol_roadblock_east"];

		{
			_handle = [_x, "PATROL", _ar4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_roadblock", "patrol_roadblock_cross"];

		{
			_handle = [_x, "GARRISON", _shotgun2, [100]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};

			_handle = [_x, "PATROL", _shotgun2, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["garr_roadblock_west", "garr_roadblock_east"];

		SR_Hack = [hack1, hack2];
		publicVariable "SR_Hack";

		"Mission Loaded" remoteExec ["systemChat", 0];
	};
    case 1: { // Roadblock reinforcements
	    _handle = ["reinf_roadblock_vic_north", "VEHICLE", _carPkm, ["marker_roadblock", false, ["patrol_roadblock", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		{
			_handle = [_x, "PATROL", _ar4, ["marker_roadblock", "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _at2, ["marker_roadblock", "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_roadblock_east", "reinf_roadblock_west", "reinf_roadblock_intel"];

	};
	case 2: { // Populate intel
	    // Rampage remaining units
        [rp_roadblock] spawn fw_fnc_rampageArea;

		// Spawn a patrol to run into
		_handle = ["reinf_roadblock_intel", "PATROL", _ar4, ["reinf_roadblock_intel", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_roadblock_town", "PATROL", _ar4, ["marker_roadblock", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Spawn a vehicle to run into
		_handle = ["reinf_roadblock_vic_town", "VEHICLE", _carPkm, ["reinf_roadblock_vic_town", false, ["reinf_roadblock_vic_town", "P"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Populate intel
		_handle = ["patrol_intel", _civs, 7] spawn fw_fnc_civSpawn;
		waitUntil {scriptDone _handle};

		_handle = ["patrol_intel", "GARRISON", _shotgun2, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_intel", "GARRISON", _shotgun2, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_intel", "GARRISON", _ar4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["patrol_intel", "PATROL", _shotgun2, ["patrol_intel", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_intel", "PATROL", _shotgun2, ["patrol_intel", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_intel", "PATROL", _ar4, ["patrol_intel", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 3: { // Intel reinforcement
	    _handle = ["reinf_intel_north", "PATROL", _rifle8, ["patrol_intel", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_intel_north", "PATROL", _rifle8, ["patrol_intel", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 4: { // Intel reinforcement 2
		_handle = ["reinf_intel_west", "PATROL", _ar4, ["patrol_intel", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_intel_west", "PATROL", _ar4, ["patrol_intel", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_intel_south", "PATROL", _ar4, ["patrol_intel", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_intel_south", "PATROL", _ar4, ["patrol_intel", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_intel_vic", "VEHICLE", _carPkm, ["patrol_intel", false, ["patrol_intel", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 5: { // Populate Hack1
		// Rampage remaining units
		[rp_intel] spawn fw_fnc_rampageArea;

        // A patrol to run into
		_handle = ["reinf_hack1_north", "PATROL", _rifle8, ["reinf_intel_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_hack1_north", "PATROL", _at2, ["reinf_intel_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Populate Hack1
		_handle = ["patrol_hack1", "GARRISON", _ar4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		{
			_handle = [_x, "PATROL", _marksman4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _at2, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};

		} forEach ["patrol_hack1_north", "patrol_hack1_south"];
	};
	case 6: { // Hack1 reinforcement

	    _handle = ["reinf_hack1_south", "PATROL", _rifle8, ["patrol_hack1", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_hack1_fob", "PATROL", _rifle8, ["patrol_hack1", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_hack1_fob", "PATROL", _rifle8, ["patrol_hack1", "R"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["reinf_hack1_vic", "VEHICLE", _carDshkm, ["patrol_hack1", false, ["patrol_hack1", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	case 7: { // Hack1 reinforcement 2

	    _handle = ["reinf_hack1_west", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_hack1_west", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["reinf_hack1_vic", "VEHICLE", _truck9, ["patrol_hack1_south", false, ["patrol_hack1", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["reinf_hack1_south", "PATROL", _ar4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_hack1_south", "PATROL", _ar4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	case 8: { // Populate FOB
		// Rampage remaining units
		[rp_hack1] spawn fw_fnc_rampageArea;

		// A patrol to run into
		_handle = ["reinf_fob_north", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_fob_north", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_fob_south", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_fob_south", "PATROL", _special4, ["patrol_hack1", "RP"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Populate FOB
		_handle = ["patrol_fob", "GARRISON", _shotgun2, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_fob", "GARRISON", _special4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_fob", "GARRISON", _ar4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		{
			_handle = [_x, "PATROL", _marksman4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _at2, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_fob_north", "patrol_fob_east", "patrol_fob_west", "patrol_fob_south"];

		_handle = ["patrol_fob_entrance", "PATROL", _special4, ["patrol_fob_entrance", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 9: { // FOB reinforcement

		{
			_handle = [_x, "PATROL", _rifle8, ["patrol_fob_east", "R"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _at2, ["patrol_fob_east", "R"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};

		} forEach ["reinf_fob_north", "reinf_fob_west", "reinf_fob_south"];

		_handle = ["reinf_fob_vic", "VEHICLE", _carDshkm, ["patrol_fob_entrance", false, ["patrol_fob_entrance", "R"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	case 10: { // Populate Hack2

	    // Final reinforcements
		{
			_handle = [_x, "PATROL", _rifle8, ["patrol_fob_east", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["patrol_fob_east", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};

		} forEach ["reinf_fob_north", "reinf_fob_west", "reinf_fob_south"];

		// Rampage remaining units
		[rp_fob] spawn fw_fnc_rampageArea;

		// A patrol to run into
		_handle = ["reinf_fob_hack2", "PATROL", _rifle8, ["reinf_fob_hack2", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["reinf_fob_hack2", "PATROL", _special4, ["patrol_fob_east", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		// Populate Hack2
		{
			_handle = [_x, "PATROL", _special4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_hack2_left", "patrol_hack2_right"];

		{
			_handle = [_x, "PATROL", _ar4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _at2, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_hack2_north", "patrol_hack2_east", "patrol_hack2_south", "patrol_hack2_west"];

		_handle = ["patrol_hack2_west", "PATROL", _sniper2, ["patrol_hack2_west", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_hack2_east", "PATROL", _shotgun2, ["patrol_hack2_east", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_hack2_south", "PATROL", _rifle8, ["patrol_hack2_south", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_hack2_north", "PATROL", _rifle8, ["patrol_hack2_north", "P"]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	case 11: { // Hack2 reinforcement
		{
			_handle = [_x, "PATROL", _special4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_hack2_southwest", "reinf_hack2_south", "reinf_hack2_southeast"];

		_handle = ["reinf_hack2_vic_north", "VEHICLE", _truck9, ["patrol_hack2_east", false, ["marker_hack2", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 12: { // Hack2 reinforcement 2
		{
			_handle = [_x, "PATROL", _ar4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_hack2_north", "reinf_hack2_northwest"];

		_handle = ["reinf_hack2_vic_south", "VEHICLE", _truck9, ["patrol_hack2_south", false, ["marker_hack2", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

	};
	case 13: { // Hack2 reinforcement 3
		{
			_handle = [_x, "PATROL", _rifle8, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _ar4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["marker_hack2", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_hack2_north", "reinf_hack2_south"];

		_handle = ["reinf_hack2_vic_north", "VEHICLE", _carDshkm, ["patrol_hack2_left", false, ["marker_hack2", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		_handle = ["reinf_hack2_vic_south", "VEHICLE", _carDshkm, ["patrol_hack2_left", false, ["marker_hack2", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
	};
	case 14: { // Populate HVT

		// Rampage remaining units
		[rp_hack2] spawn fw_fnc_rampageArea;

		// Populate HVT
		_handle = ["patrol_hvt", "GARRISON", _special4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_hvt", "GARRISON", _special4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};
		_handle = ["patrol_hvt", "GARRISON", _special4, [200]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		{
			_handle = [_x, "PATROL", _special4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, [_x, "P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["patrol_hvt_north", "patrol_hvt_east", "patrol_hvt_west"];

	};
	case 15: { // HVT reinforcement
		_handle = ["reinf_hvt_vic", "VEHICLE", _carDshkm, ["patrol_hvt", false, ["patrol_hvt", "RP"]]] spawn fw_fnc_spawnTemplate;
		waitUntil {scriptDone _handle};

		{
			_handle = [_x, "PATROL", _special4, ["patrol_hvt", "R"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["patrol_hvt", "R"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_hvt_north", "reinf_hvt_south"];
	};
	case 16: { // HVT reinforcement 2
		{
			_handle = [_x, "PATROL", _special4, ["patrol_hvt", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["patrol_hvt", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
			_handle = [_x, "PATROL", _special4, ["patrol_hvt", "RP"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		} forEach ["reinf_hvt_north", "reinf_hvt_west", "reinf_hvt_south"];
	};
	case 17: { // HVT reinforcement 3
		// Rampage remaining units
		[rp_hvt] spawn fw_fnc_rampageArea;
	};
	case 99: { // End mission
		{if (side _x == opfor || side _x == independent) then {_x setDamage 1}} forEach allUnits;

		"Mission Complete" remoteExec ["systemChat", 0];
	};
};

["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent; 
