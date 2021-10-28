
// ACE Gear Save Disable
ace_respawn_savePreDeathGear = false;

// Disable AA targeting on infantry
["forgetaa1", "onEachFrame", { {if (vehicle _x == _x) then { aa1 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
// ["forgetaa2", "onEachFrame", { {if (vehicle _x == _x) then { aa2 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa3", "onEachFrame", { {if (vehicle _x == _x) then { aa3 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa4", "onEachFrame", { {if (vehicle _x == _x) then { aa4 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
// ["forgetaa5", "onEachFrame", { {if (vehicle _x == _x) then { aa5 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
// ["forgetaa6", "onEachFrame", { {if (vehicle _x == _x) then { aa6 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa7", "onEachFrame", { {if (vehicle _x == _x) then { aa7 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa8", "onEachFrame", { {if (vehicle _x == _x) then { aa8 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa9", "onEachFrame", { {if (vehicle _x == _x) then { aa9 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa10", "onEachFrame", { {if (vehicle _x == _x) then { aa10 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
// ["forgetaa11", "onEachFrame", { {if (vehicle _x == _x) then { aa11 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa12", "onEachFrame", { {if (vehicle _x == _x) then { aa12 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa13", "onEachFrame", { {if (vehicle _x == _x) then { aa13 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa14", "onEachFrame", { {if (vehicle _x == _x) then { aa14 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa15", "onEachFrame", { {if (vehicle _x == _x) then { aa15 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa16", "onEachFrame", { {if (vehicle _x == _x) then { aa16 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
// ["forgetaa17", "onEachFrame", { {if (vehicle _x == _x) then { aa17 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa18", "onEachFrame", { {if (vehicle _x == _x) then { aa18 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;
["forgetaa19", "onEachFrame", { {if (vehicle _x == _x) then { aa19 forgetTarget _x } } forEach allPlayers; }] call BIS_fnc_addStackedEventHandler;

// this addEventHandler ["fired", {
// 	params ["_unit"];
// 	_unit spawn {
// 		params ["_unit"];
// 		(group _unit) setCombatMode "BLUE";
// 		sleep 20;
// 		(group _unit) setCombatMode "RED";
// 		if (count (magazinesAmmo _unit) == 0) then {
// 			sleep 40;
// 			_unit setVehicleAmmo 1;
// 		};
// 	};
// }];
