---
title: 'Knowledge Base - Destroy Task Module'
---

# Destroy Task Module

## Description
This module adds support for Destroy Tasks/Missions.

The mission maker must define target units, the framework will monitor the status of those units.

A threshold must be set, specifying the given amount of targets that have to be destroyed in order to complete the task.

The module can also trigger mission complete or mission fail.

## Usage
### Setup Object(s)
1. Setup the Destroy Task set
2. Place down the target unit(s)
3. Call the `SOG_destroy_fnc_makeTarget` function within the targets' init field that links the unit to the Destroy Task

```js
Arguments:
	0: OBJECT - The AI unit or object
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_destroy_fnc_makeTarget
```

### Register Task
4. Register the Destroy Task by calling the `SOG_destroy_fnc_registerDestroyTask` function within the init field of the task

```js
Arguments:
	0: STRING - ID of the task
	1: SCALAR - Number of targets escaped to fail the task
	2: SCALAR - Number of targets destroyed to complete the task
	3: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	4: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	5: BOOLEAN - Does the task have a time limit (Optional, default: false)
	6: TIME - Number of seconds before targets escape (Optional, default: 45) ** timeLimit Must Be Enabled **

Example:
	// Default No Time Limit
	["task_name", 1, 2, false] call SOG_destroy_fnc_registerDestroyTask

	// Destroy Within Time Limit
	["task_name", 1, 2, false, false, true, 45] call SOG_destroy_fnc_registerDestroyTask
```

## Links
[Home](/knowledgebase/framework) |
[Attack Module](/knowledgebase/framework/attack) |
[Destroy Module](/knowledgebase/framework/destroy) |
[Hostage Module](/knowledgebase/framework/hostage) |
[HVT Module](/knowledgebase/framework/hvt) |
[IED Module](/knowledgebase/framework/ied)