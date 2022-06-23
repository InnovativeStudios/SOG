---
title: 'Knowledge Base - Hostage Task Module'
---

# Hostage Task Module

## Description
This module adds support for Hostage Tasks/Missions.

The mission maker must define hostage units, the framework will monitor the status of those units.

An extraction area and a threshhold must be set, specifying a given amount of hostages that have to be in the extraction zone in order to complete the task.

The module can also trigger mission complete or mission fail.

## Usage
### Setup Hostage(s)
1. Setup the Hostage Task set
2. Place down the hostage unit(s)
3. Place down an area marker that marks the extraction zone, also give it a unique name
4. Call the `SOG_hostage_fnc_makeHostage` function within the hostages' init field that links the unit to the Hostage Task

```js
Arguments:
	0: OBJECT - The AI unit
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_hostage_fnc_makeHostage
```

### Setup Shooter(s)
5. Place down the shooter units(s) _(Optional)_
6. Call the `SOG_hostage_fnc_makeShooter` function within the shooters' init field that links the unit to the Hostage Task _(Optional, **Shooter Unit(s) Must Be Placed**)_

```js
Arguments:
	0: OBJECT - The AI unit
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_hostage_fnc_makeShooter
```
### Register Task
6. Register the Hostage Task by calling the `SOG_hostage_fnc_registerHostageTask` function within the init field of the task

```js
Arguments:
	0: STRING - ID of the task
	1: STRING - Marker name for the extraction zone
	2: SCALAR - Number of hostages KIA to fail the task
	3: SCALAR - Number of hostages rescued to complete the task
	4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	6: ARRAY - Array of task types to select from (Optional, default: [false, false])
	7: BOOLEAN - Does the task have a time limit (Optional, default: false)
	8: TIME - Number of seconds before hostages are killed (Optional, default: 45) ** timeLimit Must Be Enabled **

Example:
	// Default No Time Limit
	["task_name", "marker_name", 1, 2, false] call SOG_hostage_fnc_registerHostageTask

	// CBRN Attack When Time Limit Expires
	["task_name", "marker_name", 1, 2, false, false, [true, false], true, 45] call SOG_hostage_fnc_registerHostageTask

	// Execution When Time Limit Expires
	["task_name", "marker_name", 1, 2, false, false, [false, true], true, 45] call SOG_hostage_fnc_registerHostageTask
```

## Links
[Home](/knowledgebase/framework) |
[Attack Module](/knowledgebase/framework/attack) |
[Destroy Module](/knowledgebase/framework/destroy) |
[Hostage Module](/knowledgebase/framework/hostage) |
[HVT Module](/knowledgebase/framework/hvt) |
[IED Module](/knowledgebase/framework/ied)