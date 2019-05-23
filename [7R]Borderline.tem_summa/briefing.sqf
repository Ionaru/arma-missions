
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
Make by Ionaru, using 7R framework.
<br/><br/>
Made with F3 (http://www.ferstaberinde.com/f3/en/)
"]];


// ====================================================================================

// NOTES: EXECUTION
// The code below creates the execution sub-section of notes.

_exe = player createDiaryRecord ["diary", ["Execution","
<br/>
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Make use of the Namer IFVs and Fuchs APCs for movement, and the supplied UAV to scout for enemy forces.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion by vehicle, reinsertion by rally tent.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supply drops are available.
<br/><br/>
<font size='18'>SPECIAL TASKS</font>
<br/>
None
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Find the Russian minister in Summa, retrieve intel on the location of the Russian installations and remove the Russian forces from East Karelia.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
Satellite imagery has shown increased military buildup of Russian forces in the region of East Karelia. We believe them to be making use of the old bunkers and structures that were left over from a long-past war that they believe still hold strategic value.
<br/>

<br/>
The same is true for the farmland and forests surrounding Summa, a small town near the Finnish border of East Karelia. One particular resident of Summa, who wishes to remain anonymous, has been working as an informant and is an invaluable information resource to NATO.
<br/>

<br/>
Threatened by the military buildup, NATO has authorized a preemptive incursion into East Karelia. The goal is to destabilize the Russian presence in the region, and destroy any heavy assets and equipment that the Russians have stationed in the region.
<br/>

<br/>
Unfortunately our informant has not been able to provide us with the exact locations of the Russian military installations, but believes a Russian minister has set up a temporary office in Summa from where he coordinates buildup in the region.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Russian Motor Rifle Troops
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
United NATO Forces
"]];

// ====================================================================================
