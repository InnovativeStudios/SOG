---
title: 'Knowledge Base - Attack Task Module'
---

# Attack Task Module

## Description
This module adds support for Attack Tasks/Missions.

The mission maker must define target units, the framework will monitor the status of those units.

A threshold must be set, specifying the given amount of targets that have to be eliminated in order to complete the task.

The module can also trigger mission complete or mission fail.

## Usage
### Setup Target(s)
1. Setup the Attack Task set
2. Place down the target unit(s)
3. Call the `SOG_attack_fnc_makeTarget` function within the targets' init field that links the unit to the Attack Task

```js
Arguments:
	0: OBJECT - The AI unit or object
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_attack_fnc_makeTarget
```

### Register Task
4. Register the Attack Task by calling the `SOG_attack_fnc_registerAttackTask` function within the init field of the task

```js
Arguments:
	0: STRING - ID of the task
	1: SCALAR - Number of targets escaped to fail the task
	2: SCALAR - Number of targets eliminated to complete the task
	3: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	4: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	5: BOOLEAN - Does the task have a time limit (Optional, default: false)
	6: TIME - Number of seconds before targets escape (Optional, default: 45) ** timeLimit Must Be Enabled **

Example:
	// Default No Time Limit
	["task_name", 1, 2, false] call SOG_attack_fnc_registerAttackTask

	// Attack Within Time Limit
	["task_name", 1, 2, false, false, true, 45] call SOG_attack_fnc_registerAttackTask
```

## Links
[Home](/knowledgebase/framework) |
[Attack Module](/knowledgebase/framework/attack) |
[Destroy Module](/knowledgebase/framework/destroy) |
[Hostage Module](/knowledgebase/framework/hostage) |
[HVT Module](/knowledgebase/framework/hvt) |
[IED Module](/knowledgebase/framework/ied)