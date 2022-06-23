---
title: 'Wiki - HVT Task Module'
---

# HVT Task Module
## Description
This module adds support for HVT Capture or Eliminate Tasks/Missions.

The mission maker must define HVT units, the framework will monitor the status of those units.

An extraction area and a threshold must be set, specifying the given amount of HVTs that have to be in the extraction zone or eliminated in order to complete the task.

The module can also trigger mission complete or mission fail.

## Usage
### Setup HVT(s)
1. Setup the HVT Task set
2. Place down the HVT unit(s)
3. Place down an area marker that marks the extraction zone, also give it a unique name
4. Call the `SOG_hvt_fnc_makeHVT` function within the HVTs' init field that links the unit to the HVT Task

```js
Arguments:
	0: OBJECT - The AI unit
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_hvt_fnc_makeHVT
```

### Register Task
5. Register the HVT Task by calling the `SOG_hvt_fnc_registerHvtTask` function within the init field of the task

```js
Arguments:
	0: STRING - ID of the task
	1: STRING - Marker name for the extraction zone
	2: SCALAR - Number of hvts KIA or escaped to fail the task
	3: SCALAR - Number of captured or eliminated hvts to complete the task
	4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	6: ARRAY - Array of task types to select from (Optional, default: [true, false])
	7: BOOLEAN - Does the task have a time limit (Optional, default: false)
	8: TIME - Number of seconds before hvts escape (Optional, default: 45) ** timeLimit Must Be Enabled **

Example:
	// Capture No Time Limit
	["task_name", "marker_name", 1, 2, false, false, [true, false]] call SOG_hvt_fnc_registerHvtTask

	// Eliminate No Time Limit
	["task_name", "marker_name", 1, 2, false, false, [false, true]] call SOG_hvt_fnc_registerHvtTask

	// Capture Within Time Limit
	["task_name", "marker_name", 1, 2, false, false, [true, false], true, 45] call SOG_hvt_fnc_registerHvtTask

	// Eliminate Within Time Limit
	["task_name", "marker_name", 1, 2, false, false, [false, true], true, 45] call SOG_hvt_fnc_registerHvtTask
```

## Links
[Home](/wiki/framework) |
[Attack Module](/wiki/framework/attack) |
[Destroy Module](/wiki/framework/destroy) |
[Hostage Module](/wiki/framework/hostage) |
[HVT Module](/wiki/framework/hvt) |
[IED Module](/wiki/framework/ied)