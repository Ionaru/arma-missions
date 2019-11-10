setPlayerRespawnTime 999999;

// Start Spectator
[true] call acre_api_fnc_setSpectator;
["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;
