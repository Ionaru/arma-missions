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
Defend the captured outpost from the KAF counter-attack.
<br/><br/>
Then push further into KAF territory, find information on ""Project Eitr"" and sabotage it, if needed.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
A successful operation conducted by the USMC yesterday night has resulted in the capture of General Medvedev and the capture of a KAF outpost.
<br/><br/>
The General has been brought to a secure location, where he is being interrogated.
General Medvedev has confirmed that the KAF are working on a secret project, codenamed ""Project Eitr"", but thus far has refused to give any more information.
NATO considers information on ""Project Eitr"" to be of high importance and has ordered the USMC to find out more about it.
<br/><br/>
MEanwhile, intel suggests the KAF will launch a counter-attack on the captured KAF outpost in an attempt to recapture it.
<br/><br/>
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Kolgujev Armed Forces (KAF), infantry, motorized and mechanized.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Kolgujev Independence Forces and USMC.
"]];

// ====================================================================================
