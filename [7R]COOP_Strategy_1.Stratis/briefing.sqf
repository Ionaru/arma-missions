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
<font size='18'>COMMANDER'S INTENT</font>
<br/>
We'll approach Mike-26 from the eastern side of the island. After which we'll move south-west the secure the other objectives.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Getting some legwork in, bois!
Reinsertion by FOB.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Only supply drops are available at this time.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
British Armed Forces:
<br/>

<br/>
Recapture Air Station Mike-26, Camp Maxwell and the small town of Girna.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
It has been months since NATO drove CSAT forces off Altis and Stratis and declared 'job done' on the islands. Thinking the AAF would be able to restore order by themselves, NATO focused its peacekeeping efforts on other parts of the world.
<br/>

<br/>
Meanwhile the Russian government has taken an interest in the Mediterranean islands because of their strategic position nearby core EU members. They have been covertly corrupting, funding and equipping the left-over FIA forces on both islands.
<br/>

<br/>
For months, the FIA has been slowly gaining ground on both islands, consistently winning battles and skirmishes against the AAF, no doubt relying on Russian tech and strategies.
<br/>

<br/>
Word of Russia's involvement got out to NATO when an FIA defector was found by the Greek coast guard on patrol in the Aegean Sea. Not wanting to give Russia a foothold so close to EU borders, an invasion of the islands was immediately put into action.
<br/>

<br/>
The invasion force consists of the US Army, Bundeswehr and British Armed Forces, each tasked to recapture different parts of the two islands.
<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
FIA
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
AAF, US Army, Bundeswehr, British Armed Forces
"]];

// ====================================================================================
