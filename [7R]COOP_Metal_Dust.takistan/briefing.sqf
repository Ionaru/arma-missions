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
Use the BRDMs to drive north and enter the mountain pass, approach the roadblock carefully.
<br/><br/>
<font size='18'>MOVEMENT PLAN</font>
<br/>
BRDMs are available for movement, but they can be left behind if that proves a tactical advantage.
<br/><br/>
<font size='18'>FIRE SUPPORT PLAN</font>
<br/>
Supply drops, CAS and artillery available.
<br/>
Additional BRDMs available through airdrop.
"]];

// ====================================================================================

// NOTES: MISSION
// The code below creates the mission sub-section of notes.

_mis = player createDiaryRecord ["diary", ["Mission","
<br/>
Our mission is to force our way into Mujahideen territory, destroy any resistance on the way to Feruz Abad and dismantle the industrial complex.
"]];

// ====================================================================================

// NOTES: SITUATION
// The code below creates the situation sub-section of notes.

_sit = player createDiaryRecord ["diary", ["Situation","
<br/>
May 28th, 1982.
<br/>
The Democratic Republic of Afghanistan (DRA) and Mujahideen forces have been fighting over control of Afghanistan for over 3 years, but at this moment neither facion is making any significant progress in eliminating the other.
The two global superpowers are using this war for their own gain, each backing a side of this conflict. While the Soviet Union backs the DRA, the Mujahideen is being funded and equipped by the USA.
<br/>
Feruz Abad is this region's capital and currently inside Mujahideen territory. The city houses a major industrial complex, building weapons and other military equipment.
Fortified positions and outposts litter the area at strategic points.

<br/>
All but one of the mountain passes towards Feruz Abad have been mined to prevent any vehicles from going through, a roadblock on the Mujahideen side of the mountains checks all civilian traffic that passes through.
Soviet intel believes this is the weakest point in their defences high command and has ordered an offensive force to enter the area there.

<br/><br/>
<font size='18'>ENEMY FORCES</font>
<br/>
Mujahideen, motorised and mechanised, backed by United States and various other countries.
<br/><br/>
<font size='18'>FRIENDLY FORCES</font>
<br/>
Democratic Republic of Afghanistan and Soviet joint army.
"]];

// ====================================================================================



// !alive doc1 && !alive doc2 && !alive doc3 && !alive doc4 && !alive doc5 && !alive doc6 && !alive doc7 && !alive doc8
