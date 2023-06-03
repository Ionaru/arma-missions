/*
	Create Briefing with:
	http://www.ferstaberinde.com/f3/f3webtools/index.php

	Paste result into this file.
*/

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: NATO

// ====================================================================================

// TASKS
// The code below creates tasks. Two (commented-out) sample tasks are included.
// Note: tasks should be entered into this file in reverse order.

// _task2 = player createSimpleTask ["OBJ_2"];
// _task2 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task2 setSimpleTaskDestination WAYPOINTLOCATION;
// _task2 setTaskState "Created";

// _task1 = player createSimpleTask ["OBJ_1"];
// _task1 setSimpleTaskDescription ["IN DEPTH OBJECTIVE DESCRIPTION", "SHORT OBJECTIVE DESCRIPTION", "WAYPOINT TEXT"];
// _task1 setSimpleTaskDestination WAYPOINTLOCATION;
// _task1 setTaskState "Created";

// ====================================================================================

// NOTES: CREDITS
// The code below creates the administration sub-section of notes.

_cre = player createDiaryRecord ["diary", ["Credits","
<br/>
Created by Ionaru
<br/>

<br/>
Using 7R Framework
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion and transport by vehicle.
<br/>
Reinsertion by FOB, Rally Point or vehicle.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supply drops: 15
<br/>
Artillery ammo: 45
<br/>
CAS ammo: Unavailable
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Breach into KAF held territory, find their newly constructed FOB and capture General Medvedev.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Kolgujev is still in civil war, with the Kolgujev Independence Forces (KIF) fighting the Kolgujev Armed Forces (KAF).
NATO support the Independence Forces, while the Russians support the KAF. Until now, support has been limited to supplies and training.
<br/><br/>
Around two weeks ago, a small group of Independence Forces were able to destroy the KAF artillery vehicles and kill who they believed to be the KAF commander.
Unfortunately, that group of Independence Forces was killed during a large-scale retaliation invasion by the KAF.
To make things worse, intel on commander Viktor Sudakov was wrong, and the real commander of the KAF, General Medvedev, was not present during the attack.
<br/><br/>
The KAF have been able to capture a large part of the nation, and have just finished constructing an FOB in a forest near the current frontline.
Intel suggests that General Medvedev is currently visiting this FOB. If we can capture him, we can end this conflict before it escalates any further.
<br/><br/>
NATO has asked the USMC to send a small team to Kolgujev to accomplish this mission.
<br/><br/>
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Kolgujev Armed Forces (KAF), infantry with some motorized vehicles.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Kolgujev Independence Forces and USMC.
"]];

// ====================================================================================
