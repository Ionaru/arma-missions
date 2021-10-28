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
Made by Ionaru,
<br/>

<br/>
Using 7R framework.
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Use transports to approach the northern island's only connection to the main island. Search for, and destroy the T100 battle tanks.
<br/>
Use Whiskey to destroy the tanks, MAT will be needed to destroy enemy AA.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion by transport vehicle, reinsertion by FOB.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Whiskey will provide CAS.
<br/>
12 supply drops available.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Destroy the Rebel's new battle tanks.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
After a long and costly conflict, most of Isla Duala is now under NATO control. Rebel forces have retreated back to the northern island which is now heavily fortified.
<br/>

<br/>
While discussing on how to finish the liberation of this African group of islands, a message was intercepted that details the purchase of 8 T100 Black Eagle main battle tanks by the rebels.
<br/>

<br/>
Because it always takes some time to get new battle tanks operational, we need to strike now!
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Rebel forces using Russian equipment and vehicles.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
US Army with USAF support.
"]];

// ====================================================================================
