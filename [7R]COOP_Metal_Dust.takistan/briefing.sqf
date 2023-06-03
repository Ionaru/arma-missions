/*
	Create Briefing with:
	http://www.ferstaberinde.com/f3/f3webtools/index.php

	Paste result into this file.
*/

// F3 - Briefing
// Credits: Please see the F3 online manual (http://www.ferstaberinde.com/f3/en/)
// ====================================================================================
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
Use the vehicles to drive north and enter the mountain pass, approach the roadblock carefully.
<br/>
An explosives expert will be required to destroy the industrial complex.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
Humvees are available for movement, but they can be left behind if that proves a tactical advantage.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supply drops, CAS and artillery available.
<br/>
Additional Humvees available through airdrop.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Our mission is to force our way into Takistani territory, destroy any resistance on the way to Feruz Abad and destroy the industrial complexes.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
May 28th, 1992.
<br/>
Takistani Armed Forces have been manufactoring weapons and vehicles on a massive scale in this region. High command believes a pre-emptive strike on those facilities is required.

<br/>
All but one of the mountain passes towards Feruz Abad have been mined by the Takistani to control the flow of traffic through the mountains.
A Takistani roadblock has been set up in the only pass that has not been mined, intel believes this is the weakest point in their defences high command and has ordered an offensive force to enter the area there.

<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Takistani Armed Forces
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
USA
"]];

// ====================================================================================



// !alive doc1 && !alive doc2 && !alive doc3 && !alive doc4 && !alive doc5 && !alive doc6 && !alive doc7 && !alive doc8
