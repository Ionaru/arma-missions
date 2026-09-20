# 7R Framework, mission side

**Where am I?** If a `mission.sqm` sits next to this file, this is an Arma 3 mission folder. If not, this is `Framework Files/` in the framework repo, and `../AGENTS.md` applies too.

This whole folder is copy-pasted into each mission, so a mission carries its own full copy of the framework. There is no shared include and no build step.

## What is yours to edit

| File | Contents |
|---|---|
| `mission.sqm` | Eden editor data. Plain text, `binarizationWanted=0`. |
| `briefing.sqf` | `createDiaryRecord` calls from the 7R Briefing Generator. |
| `loadouts/` | One faction's loadout set, flattened, then hand-edited. |
| `7R/fn_missionManager.sqf` | This mission's phase logic. |
| `7R/fn_systemInit.sqf` | Numeric tunables. |
| `description.ext` | Mission settings. Yours, with three exceptions below. |

`description.ext` is the mission maker's file, not framework boilerplate. Respawn mode and delay, debug console, `disabledAI`, debriefing endings, and anything else on the [BI wiki's Description.ext page](https://community.bistudio.com/wiki/Description.ext) are yours to set. Three things in it belong to the framework:

- `class CfgFunctions { #include "7R\Shared\functions.hpp" };` registers every `fw_fnc_*`. Without it nothing in `7R/` resolves.
- `class CfgSounds { #include "7R\Sounds\sounds.hpp" };` is the framework's sound library.
- The `variable =` names in `CfgDebriefingSections` (`SR_CC`, `SR_KIA`, `SR_WC`) are set by framework code in `7R/Init/fn_frameworkInit.sqf` and written by `onPlayerKilled.sqf` and the AI event handlers. Rename one and that section goes empty.

Everything else under `7R/`, plus `Init.sqf`, `initPlayerLocal.sqf`, `onPlayerKilled.sqf` and `onPlayerRespawn.sqf`, is framework code. A mission may legitimately trim them (the Loadouts Showcase cuts `initPlayerLocal.sqf` from 116 lines to 15; Ground Training Center empties `onPlayerKilled.sqf`), but that is a deliberate, documented choice. An accidental edit means the mission has drifted, and the fix belongs in the framework repo.

## Rules

**Never binarize the scenario file.** Leave "Binarize the Scenario File" unchecked in Eden. A binarized `mission.sqm` is unreadable to humans and agents.

**`fn_systemInit.sqf` is the tunables file, despite the name.** Edit it freely: unit cap, night settings, supply boxes, support aircraft classnames, ammo counts. **`7R/Init/fn_frameworkInit.sqf` is not.** It sets internal engine state and looks deceptively similar.

**Functions are `fw_fnc_<name>`, defined at `7R/<Module>/fn_<name>.sqf`** and registered in `7R/Shared/functions.hpp`. Adding a function to a mission is almost always the wrong move: add it to the framework and re-sync.

**Mod functions are not here.** `sr_support_fnc_*`, `ace_*`, `acre_api_fnc_*`, `CBA_fnc_*`, `BIS_fnc_*` come from ACE3, ACRE2, CBA and the 7R support addon.

**Loadout paths are relative to the mission root.** Framework code calls `"loadouts\_supply_drop_content.sqf"` and friends by fixed relative path, so `loadouts/` must be flat: no `MODERN/` or faction subfolder.

## Where to look

- **Function reference and objective recipes:** the [wiki](https://github.com/DextroNC/Framework/wiki). Pages worth knowing by name: *Creating a new mission*, *Mission Settings*, *Mission Objectives*, *Mission Manager*, *Checklist finished missions*, *Headless Client*, *Code Snippets*.
- **Skill:** `mission-authoring`, for creating a mission, wiring phases, tuning settings, and the pre-release pass.

<!-- Note for humans: copy this folder with `cp -a "Framework Files/." /path/to/mission/`
     (or drag-and-drop on Windows). Plain `cp -r "Framework Files/"*` skips .agents/ and
     .claude/, so the mission would lose its agent skills. -->
