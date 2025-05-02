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
FOB Highlander will be our first objective, it is used as a storage facility for ground vehicles. We will need those to reach the other locations captured by the British.
<br/>
We'll use our one functional helicopter to reach the nearest friendly airport and insert into the AO via HALO.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Insertion by HALO, movement by foot or vehicle.
<br/>
Reinsertion by FOB or RP.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
UAV, Artillery, CAS and supply drops available.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Recapture strategic locations on the Kintyre peninsula from British Forces.
<br/>

<br/>

"]];

// ====================================================================================

// NOTES: SITUATION
// As the economic crisis in Britain kept getting worse, and projections showed no signs of improvement.
// The British Government has become more and more reliant on the export of Scottish oil to keep the country running.
// The Scottish people, seeing their land being exploited by the British, began pushing for independence.
// As a new independence vote became more and more likely, the British Government became worried it would lose access to the rich oil fields, which would result in complete economic collapse.
// Desperate to keep the union together, and to deny an independant Scotland seeking NATO or EU membership, the British Government declared war on Scotland.
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
The economic crisis in Britain has reached a critical tipping point, with no signs of improvement on the horizon. The British Government's reliance on Scottish oil exports has become their lifeline to keep the nation afloat.
<br/><br/>
Seeing the exploitation of our beautiful land, the Scottish people have intensified their push for independence. With a new vote for independence looming, the British Government's fear of losing access to our valuable oil fields and facing inevitable economic collapse has driven them to desperate measures.
<br/><br/>
In a bid to maintain the union and prevent an independent Scotland from seeking NATO or EU membership, the British Government has taken the drastic step of declaring war on Scotland.
<br/><br/>
In a swift and aggressive move, British Forces with support of the US Army, have landed on Scottish soil. Our Armed Forces were in the midst of re-establishing command when key strategic locations on the Kintyre peninsula were seized by the enemy. Communication lines with our other bases have been severed, and we must prepare for the worst-case scenario.
<br/><br/>
Now, we stand as the troops of FOB Braveheart. It falls upon us to resist this invasion, to reclaim our territory, and to safeguard our nation's freedom.
<br/><br/>
<b>For Scotland!</b>

<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
British Armed Forces, US Army
<br/>
Infantry and some mechanized units

"]];

// ====================================================================================
