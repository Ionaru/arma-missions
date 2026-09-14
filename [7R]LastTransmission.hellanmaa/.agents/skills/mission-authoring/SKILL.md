---
name: mission-authoring
description: Create, wire up, and finish a 7R Arma 3 mission. Covers making a new mission folder from the framework, mission manager phases, the fn_systemInit tunables, headless client behaviour, and the pre-release pass.
---

# Mission authoring

A mission is a folder named `[7R]Mission_Name.<map>` containing a full copy of the framework plus the handful of files that are the mission's own. It lives in the Arma profile folder during development and exports to `MPMissions` as a `.pbo`.

**Never binarize the scenario file.** Leave "Binarize the Scenario File" unchecked in Eden. Every `mission.sqm` in the project is plain text with `binarizationWanted=0`, which is what keeps it readable and diffable.

## Create a new mission

1. Create the scenario in the Eden editor, named `[7R]Mission_Name`, binarization off.
2. Copy the framework in so the dotfolders come with it:
   ```bash
   cp -a "Framework Files/." "/path/to/[7R]Mission_Name.map/"
   ```
   Plain `cp -r "Framework Files/"*` skips `.agents/` and `.claude/`, and the mission loses its agent skills.
3. Place the **7R Base** composition first. It carries the playable slots, `STARTSPAWN` marker and support spawn.
4. Copy one loadout set from `loadouts/<Era>/<Tier_Faction>[/<Variant>]/` **flat** into `<mission>/loadouts/`. No era or faction subfolder: framework code calls fixed relative paths like `execVM "loadouts\_supply_drop_content.sqf"`.
5. Place the **7R AO Marker** composition over the area of operations.
6. Write `7R/fn_missionManager.sqf` phases and tune `7R/fn_systemInit.sqf`.
7. Generate the briefing with the 7R Briefing Generator and paste it into `briefing.sqf`.

Six things are yours: `mission.sqm`, `briefing.sqf`, `loadouts/`, `7R/fn_missionManager.sqf`, `7R/fn_systemInit.sqf` and `description.ext`. If you find yourself editing anything else under `7R/`, or `Init.sqf`, `initPlayerLocal.sqf`, `onPlayerKilled.sqf` or `onPlayerRespawn.sqf`, the change usually belongs in the framework repo instead.

## Mission manager phases

`7R/fn_missionManager.sqf` is a `switch` over a phase number, called from an Eden trigger:

```sqf
nul = [0] spawn fw_fnc_missionManager;
```

Everything outside the switch is framework boilerplate that runs on every call. Only the case bodies are yours:

```sqf
// Server only execute or HC if present
if (!isServer && hasInterface) exitWith {};
if (HC in allPlayers && isServer) exitWith {};

params ["_nbr"];

switch (_nbr) do {
	case 0: {
		"Loading Mission" remoteExec ["systemChat", 0];

		for "_i" from 1 to 4 do {
			_handle = ["a1","PATROL",7,["a1","P"]] spawn fw_fnc_spawnTemplate;
			waitUntil {scriptDone _handle};
		};

		phase = 0;
		publicVariable "phase";
		"Mission Loaded" remoteExec ["systemChat", 0];
	};
	case 1: { };
};

["MissionLog", ["Mission", ("Case " + str(_nbr) + " loaded.")]] spawn CBA_fnc_globalEvent;
```

Rules that matter:

- **`"Loading Mission"` and `"Mission Loaded"` belong to case 0 only.** They bracket the initial spawn. Do not repeat those two strings in a later case. A later phase that wants its own announcement gets its own strings, the way `Raging_Bear` does with `"Loading Phase 2"` and `"Phase 2 Loaded"`.
- **The guards, `params ["_nbr"]` and the `MissionLog` line are boilerplate.** Copy them unchanged. The log message is built from `_nbr`, so the one line outside the switch covers every case; never add a per-case copy. Because case bodies block on `waitUntil` and `sleep`, it fires when the case *finishes*, not when it starts.
- **Cases start at 0.** Phase 0 is the initial spawn. Both Training Missions start at `case 1`, but only because they are unmodified copies of the pre-2020 template. Do not copy that shape.
- **`waitUntil {scriptDone _handle}` between spawns.** Spawning templates concurrently overloads the server and produces missing or misplaced groups.
- **`phase` is an integer**, published with `publicVariable`, and it is not one assignment per case. Put it where the mission genuinely changes phase, then advance it from a trigger with `phase = phase + 1` and call the manager with the new number. Real missions vary: `Heatshield` never sets it, `Heavy_Metal` sets it once, `Raging_Bear` sets it in four of its eight cases. The value does not have to match the case index.
- **Counter-attacks are just phases.** Add a case rather than inventing a separate mechanism. `Raging_Bear` alternates: even cases load the next objective area, odd cases run that area's counter-attack and set the new `phase`.
- `HC` is a headless client unit placed in the editor. **If the HC disconnects and reconnects around a trigger firing, phase code can execute twice.** Guard anything non-idempotent.
- Scale with player count inside a case: `if ((count allPlayers) > 20) then { ... };`. Optional and per case; the template leaves an empty placeholder in case 0.

Spawning uses `fw_fnc_spawnTemplate` (modes `PATROL`, `GARRISON`, `ZEI`, `VEHICLE`) and `fw_fnc_civSpawn`. Their parameters are on the wiki; read the page before guessing at the argument arrays.

## Settings

`7R/fn_systemInit.sqf` is the tunables file, despite the name. It runs `preInit` and is meant to be hand-edited per mission.

| Setting | Meaning |
|---|---|
| `SR_Unit_Cap` | Maximum AI units. Raise only when genuinely necessary. |
| `SR_Night` | `true` for a mission played entirely at night. Gates the NVG and strobe block in every loadout. |
| `SR_Camo_Coef` | Night camouflage coefficient, default `0.75`. |
| `SR_AI_NVG`, `SR_AI_removeNVG`, `SR_AI_addFlashlight`, `SR_AI_forceFlashlight` | Enemy night equipment. |
| `SR_Spawn_Height` | Respawn height above ground, for ships. |
| `SR_SupplyBoxes` | `[Box Class, Display Name, Supply Loadout Number, Quantity]` entries. |
| `SR_Support_Assets` | Classnames in fixed order: ParaDropPlane, SupplyDropPlane, CASPlane, ExfilHelicopter, UAV. |
| `SR_Vehicle_Drop` | Vehicles offered for vehicle drop. |
| `SupplyDropAmmo`, `ArtilleryCallAmmo`, `CASCallAmmo`, `UAVCallAmmo` | Support asset budgets. |
| `ace_trenches_trenchSupplies` | Fortification resource pool. |

**`7R/Init/fn_frameworkInit.sqf` is not a settings file.** It sets internal engine state and looks deceptively similar. Leave it alone.

AI behaviour tunables live in `7R/AI/PatrolModule/fn_patrolInit.sqf`, which marks its own sections `// Variable Init (DO NOT CHANGE)` and `// Variable Init (TO EDIT)`. The editable ones are `SR_Debug`, `SR_Flee`, `SR_Surrender`, `SR_Charge`, `SR_RAMPAGE_DISTANCE` and `SR_POI_Range`.

## description.ext

`description.ext` holds mission settings and is yours to edit. Respawn mode and delay, `enableDebugConsole`, `disabledAI`, the `CfgDebriefing` endings, and anything else on the [BI wiki's Description.ext page](https://community.bistudio.com/wiki/Description.ext) are fair game. The framework's copy is 95 lines and carries only a fraction of what the file supports: `author`, `onLoadName`, `loadScreen`, `class Header`, `overviewText`, `class Params` for mission parameters, `CfgMusic` and `CfgRespawnInventory` are all absent and can be added.

Three things in it belong to the framework:

| Keep | Why |
|---|---|
| `class CfgFunctions { #include "7R\Shared\functions.hpp" };` | Registers every `fw_fnc_*`. Drop it and nothing in `7R/` resolves. |
| `class CfgSounds { #include "7R\Sounds\sounds.hpp" };` | The framework's sound library. |
| The `variable =` names in `CfgDebriefingSections` | `SR_CC`, `SR_KIA` and `SR_WC` are initialised in `7R/Init/fn_frameworkInit.sqf` and written by `onPlayerKilled.sqf` and the AI event handlers. Rename one and that section shows nothing. |

`CfgRemoteExec` is not a whitelist here. `class Functions` sets `mode = 2` and `class Commands` sets no `mode`, and framework code `remoteExec`s 16 distinct names of which the block lists 3. Adding a target to it is documentation, not permission.

The respawn block is what missions have actually varied in practice: all five Sample Missions omit it outright and both Training Missions replace it with a bare `respawnOnStart = -1;`.

## Objectives

The wiki's **Mission Objectives** page is a cookbook of trigger recipes: Area Cleared, Destroy, Kill, Protect, Destroy Buildings, Incendiary Deployment, Hostages, HVT Arrest or Kill, IED Defusal, Dogtag Collection, Intel Collection, Investigation, Rescue Wounded, Hacking, Convoy Ambush. Read the recipe rather than reconstructing one.

## Before release

Work the wiki's **Checklist finished missions** page. The items that catch the most problems:

- Tasks are structured and every one can actually be completed.
- Every mission manager case is reachable, and phase numbers advance correctly.
- No invisible spawn zones left over from testing.
- Briefing is complete: Situation, Mission, Execution, Credits.
- AO Marker composition placed.
- Supply, artillery and CAS counts in `fn_systemInit.sqf` match what the mission intends.
- Insertion and exfil methods both work.
- Spawn templates do not over-use autocannon vehicles.
- Eden Attributes set per the wiki's **Mission Settings** page, and binarization still off.

## Reference

The [wiki](https://github.com/DextroNC/Framework/wiki) is authoritative for function signatures and recipes. Pages by name: *Creating a new mission*, *Mission Settings*, *Mission Objectives*, *Mission Manager*, *Checklist finished missions*, *Headless Client*, *Code Snippets*, *Tips and Tricks*, *Patrol Settings*, *Fortication System*, *Vehicle and Helicopter Spawn*.

Roughly 27 of ~90 framework functions have wiki pages. The rest are internal helpers, undocumented on purpose.
