
// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================

// FACTION: CTRG

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
<font size='18'>COMMANDER'S INTENT</font>
<br/>
Head out to Kinandal and liberate it, then destroy the rest of the ultranationalist forces in the north of Pulau Gurun.
<br/>
Many fortifications and bunkers have been built on the islands during the war, all known locations have been marked on your maps.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Some Humvees and old M113 have been pulled out of storage for us to use.
<br/>

<br/>
Reinsertion by vehicle or FOB
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
12 x Supply drop
<br/>
45 x Artillery ammo
<br/>
6 x CAS ammo
<br/>
250 x Fortification supplies
<br/>

<br/>
Additional Humvees can be called in by vehicle drop.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Liberate Pulau Gurun

<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Ultranationalist infantry, motorized and mechanized forces
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
US Rangers
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The Pacific islands of Pulau have seen constant conflict ever since US forces started to occupy the islands in the early days of the Vietnam War. The presence of these United States troops sparked a small ultranationalist movement among the relatively small population, but these extremists were quickly defeated by overwhelming force from the US Army.
<br/>

<br/>
In the years during, and after, the war, small skirmishes between ultranationalists and the US Army happened regularly, disrupting civilian life almost every time. The population blames the United States for their destroyed property, siding with the ultranationalists.
<br/>

<br/>
When the Pacific became less of a priority to the US military, and more and more American troops began to ship out, many outposts and structures were abandoned and assets relocated to the US military base centralized on Pulau Gurun.
<br/>
The Americans were unaware that this gave the ultranationalist movement space to rebuild, and grow their forces with huge support of the civilian population. They've been recruiting large amounts of people and equipping themselves with all the black-market gear they could get their hands on.
<br/>

<br/>
The now severely understaffed and under-equipped US base stands no chance against a force this large, ultranationalists have already captured the northern half of Pulau Gurun and we suspect they will soon attempt to capture the rest of the island.
<br/>

<br/>
The USMC has been tasked to restore peace to the island and 'liberate' its citizens from these ultranationalists.
"]];

// ====================================================================================
