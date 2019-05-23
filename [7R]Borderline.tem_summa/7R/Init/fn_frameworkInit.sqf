/*

	Parameters:
		<-- none
	
	Description:
		System Init, both static variables and EventHandlers as preInit
*/

// Global Variable Init
SR_Side = west;
AI_ART_Units = [];
if (isServer) then {
	SR_CC = "Civilian Casulties:";
	publicVariable "SR_CC";
	SR_KIA = "Those we lost in battle: ";
	publicVariable "SR_KIA";
	SR_WC = "Alleged War Criminals:";
	publicVariable "SR_WC";
};
SR_SuspicionValue = 0;
SR_SuspicionSpotted = -60;

