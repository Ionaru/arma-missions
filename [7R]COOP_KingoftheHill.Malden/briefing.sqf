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
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion and transport by vehicle.
Reinsertion by FOB.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supply drops:  12
<br/>
Artillery ammo: 45
<br/>
CAS ammo: 6
<br/>
Fortification supplies: 500
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Capture the designated towns, destroy the Russian equipment and force them off the island.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Malden served as the location of a large NATO FOB. From the island, the recapturing of Altis and Stratis were executed and supported.
Unfortunately, the island was captured by Russian forces while most local forces were deployed during the Altis offensive.
<br/><br/>
Now, eight weeks later, the Russians have complete control of the island and have begun rebuilding the military infrastructure.
Not wanting to wait, NATO command has decided to send a small force to the island to attempt a recapture before all the infrastructure is operational.
<br/><br/>
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Russian Armed Forces
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
NATO
"]];

// ====================================================================================
