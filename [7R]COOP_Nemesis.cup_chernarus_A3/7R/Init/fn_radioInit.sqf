/*
	Parameters:
		<--- None

	Auto Exec on Start.

*/
// CBA Eventhandlers
["ParaPort", {(_this select 1) allowDamage false;(_this select 1) moveInCargo [(_this select 0), (_this select 2)]; (_this select 1) assignAsCargo (_this select 0); [(_this select 1)] orderGetIn true; (_this select 1) allowDamage true; }] call CBA_fnc_addEventHandler;
["SideChatSS", {(_this select 0) sideChat (_this select 1) }] call CBA_fnc_addEventHandler;
["VehicleAmmo", {vehicle (_this select 0) setVehicleAmmo 1}] call CBA_fnc_addEventHandler;
["CombatLog", {player createDiaryRecord ["Combat Log", [_this select 0, _this select 1]]}] call CBA_fnc_addEventHandler;
["MissionLog", {player createDiaryRecord ["Mission Log", [_this select 0, _this select 1]]}] call CBA_fnc_addEventHandler;

// Channel Names
["ACRE_PRC343", "default", 1, "description", "ALPHA"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 2, "description", "BRAVO"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 3, "description", "CHARLIE"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 4, "description", "DELTA"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 5, "description", "PLATOON"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 6, "description", "ECHO 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 7, "description", "ECHO 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 8, "description", "SIERRA 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 9, "description", "SIERRA 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 10, "description", "FOXTROT 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 11, "description", "FOXTROT 2"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 12, "description", "HOTEL 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC343", "default", 13, "description", "HOTEL 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC152", "default", 1, "description", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 2, "description", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 3, "description", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 4, "description", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 5, "description", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC152", "default", 6, "description", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC148", "default", 1, "label", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 2, "label", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 3, "label", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 4, "label", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 5, "label", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC148", "default", 6, "label", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

["ACRE_PRC117F", "default", 1, "name", "PLT NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 2, "name", "COM NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 3, "name", "SUP NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 4, "name", "MECH NET"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 5, "name", "AIR NET 1"] call acre_api_fnc_setPresetChannelField;
["ACRE_PRC117F", "default", 6, "name", "AIR NET 2"] call acre_api_fnc_setPresetChannelField;

// Client Only Part
if (!hasInterface) exitWith {};

// Friendly Fire Log
_id = ["ace_unconscious", {
	params ["_unit","_state"];
	if (!(isPlayer _unit)) exitWith {};
	if (_state) then {
		private _shooter = _unit getVariable ["ace_medical_lastDamageSource", ""];
		private _shooterName = name _shooter;
		private _unitName = name _unit;

		if (_shooter in allPlayers) then {
			if (_shooterName != _unitName) then {
				private _log = format ["[Friendly Fire] - %1 shot at %2", _shooterName, _unitName];
				private _msg = format [SR_FF + "<br/>" + _shooterName + " shot at " + _unitName + "."];
				_log remoteExecCall ["diag_log", 2];
				SR_FF = _msg;
			} else {
				// Player hurt themselves.
				private _log = format ["[Friendly Fire] - %1 hurt themselves", _shooterName];
				private _msg = format [SR_FF + "<br/>" + _shooterName + " hurt themselves."];
				_log remoteExecCall ["diag_log", 2];
				SR_FF = _msg;
			};

			publicVariable "SR_FF";
		};
	};
}] call CBA_fnc_addEventHandler;

//Comm Card
player createDiarySubject ["Communication", "Communication"];
player createDiaryRecord ["Communication", ["Frequencies", "
<br/>
<font size='16'>Rifleman Radio: AN/PRC-343 PRR</font>
<br/>
Block 1 Channel 1 - Alpha <br/>
Block 1 Channel 2 - Bravo <br/>
Block 1 Channel 3 - Charlie <br/>
Block 1 Channel 4 - Delta <br/>
Block 1 Channel 5 - Platoon Actual <br/>
Block 1 Channel 6 - Echo 1<br/>
Block 1 Channel 7 - Echo 2<br/>
Block 1 Channel 8 - Sierra 1<br/>
Block 1 Channel 9 - Sierra 2<br/>
Block 1 Channel 10 - Foxtrot 1 <br/>
Block 1 Channel 11 - Foxtrot 2 <br/>
Block 1 Channel 12 - Hotel 1 (REINF)<br/>
Block 1 Channel 13 - Hotel 2 (REINF)<br/>
<br/>
<font size='16'>Platoon Radio</font>
<br/>
Channel 1 - Platoon Net (Short Wave) <br/>
Channel 2 - Command Net (Long Wave) <br/>
Channel 3 - Support Net <br/>
Channel 4 - Mech Net <br/>
Channel 5 - Air Net 1<br/>
Channel 6 - Air Net 2<br/>
"]];

player createDiaryRecord ["Communication", ["Protocol", "
<br/>
<font size='16'>Request Pickup</font>
<br/>
1. Location<br/>
2. Landing Zone Details<br/>
3. Opt. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request Supply Drop</font>
<br/>
1. Location<br/>
2. Drop Zone Details<br/>
3. Opt. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request CAS</font>
<br/>
1. Target (Marker)<br/>
2. Description (Landmarks, Target Type, Weapon Type)<br/>
3. Friendly Location<br/>
4. Opt. Recommended Approach<br/>
5. Opt. Colored Smoke Reference (on request)<br/>
<br/><br/>
<font size='16'>Request Mortar Support</font>
<br/>
1. Warning: Fire Mission<br/>
2. Type: Adjust by Fire / Fire for Effect<br/>
3. Amount: Number of Rounds (by Fire for Effect)<br/>
4. Ordanance: Type of Ordanance (HE,Smoke,Illumination)<br/>
5. Target: Location / Marker Reference<br/>
6. Opt. Spreading: Size of Area and Direction of Expansion<br/>
7. Mortar Crew will repeat the received Message as Confirmation<br/>
<br/>
Additional Terminology:<br/>
- Rounds away<br/>
- Rounds complete<br/>
- Splash out<br/>
- Adjust Fire (Direction in Mils and Distance in meters)<br/>
"]];

// Diary Record Category Init
player createDiarySubject ["Combat Log", "Combat Log"];
player createDiarySubject ["Mission Log", "Mission Log"];

// Regulations
player createDiarySubject ["Regulation", "Regulation"];
player createDiaryRecord ["Regulation", ["Equipment", "
<br/>
<font size='18'>Composition Regulations</font>
<br/>
- Loadouts must remain untouched (do not drop or replace content, Engineers may change explosives) </br>
- 2 Machine Guns max per Squad </br>
- 1 Grenadier max per Squad </br>
- 1 Entreching Tool per Squad (except Platoon is allowed more) </br>
- 1 DMR per Platoon <br/>
- Up to 1 Scope per Squad <br/>
-- perferly Rifleman, Asst. or IAR <br/>
-- Not allowed for SL, Medic, AR, MAT, MMG, Breacher, Grenadier or Saboteur <br/>
- maximum weight per soldier 40kg or default kit weight </br>
- Additional Ammunition can be carried by other members than the weapon operator (for AR, MAT or MMG Ammo) <br/>
- Additional Light AT Launchers can be carried (max 1 Nlaw per Squad)<br/>
-- 3 launchers total per Squad (incl. LAT, MAT) <br/>
-- Not to carry on AR or MMG <br/>
- Lockpicks may be carried by one Squad Member (not SL) <br/>
- One Entrenching Tool may be carried by the Squad (same restriction on roles like Scopes) <br/>
- The Platoon Leader or Sergeant may take a Laser Designator <br/>
<br/>
"]];

// Composition
player createDiarySubject ["Composition", "Composition"];
player createDiaryRecord ["Composition", ["Platoon Composition", "
<execute expression='nul = [] spawn fw_fnc_compositionDisplay'>Display Composition</execute>
"]];

player createDiarySubject ["Mortar", "Mortar"];
player createDiaryRecord ["Mortar", ["Charge 3", "
<img image='\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Static\data\M6_charge3_ca.paa' />
"]];
player createDiaryRecord ["Mortar", ["Charge 2", "
<img image='\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Static\data\M6_charge2_ca.paa' />
"]];
player createDiaryRecord ["Mortar", ["Charge 1", "
<img image='\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Static\data\M6_charge1_ca.paa' />
"]];
player createDiaryRecord ["Mortar", ["Charge 0", "
<img image='\UK3CB_BAF_Weapons\addons\UK3CB_BAF_Weapons_Static\data\M6_charge0_ca.paa' />
"]];
