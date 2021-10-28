
// ACE Gear Save Disable
ace_respawn_savePreDeathGear = false;

// ======================================================================================
/*
	Create custom radio channel.
*/

if (isServer) then
{
	private _channelName = "CustomRadioChannel";
	private _channelID = radioChannelCreate [[0.502, 0, 0, 1], _channelName, "%UNIT_NAME", []];
	if (_channelID == 0) exitWith {diag_log format ["Custom channel '%1' creation failed!", _channelName]};
	[_channelID, {_this radioChannelAdd [player]}] remoteExec ["call", [0, -2] select isDedicated, _channelName];
	missionNamespace setVariable ["CustomRadioChannel", _channelID, true];
};
systemChat "LOADED"

// ======================================================================================
// (missionNamespace getVariable "CustomRadioChannel") radioChannelAdd [this];
