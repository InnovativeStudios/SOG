---
title: 'Knowledge Base - IED Task Module'
---

# IED Task Module

## Description
This module adds support for IED Tasks/Missions.

The mission maker must define IEDs and objects, the framework will monitor the status of those IEDs and objects.

A threshold must be set, specifying a given amount of IEDs that have to be defused, and the number of objects that need to survive in order to complete the task.

The module can also trigger mission complete or mission fail.

## Usage
### Setup IED(s)
1. Setup the IED Task set
2. Place down the IED object(s)
3. Spawn the `SOG_ied_fnc_makeIED` function within the IEDs' init field that links the IED to the Defuse Task

```js
Arguments:
	0: OBJECT - The IED object
	1: STRING - The ID of the task
	2: NUMBER - The Countdown Timer

Example:
	[this, "task_name", 30] spawn SOG_ied_fnc_makeIED
```
4. Place down the object(s)
5. Call the `SOG_ied_fnc_makeObject` function within the objects' init field that links the object to the Defuse Task

```js
Arguments:
	0: OBJECT - The Object
	1: STRING - The ID of the task

Example:
	[this, "task_name"] call SOG_ied_fnc_makeObject
```

### Register Task
6. Register the Defuse Task by calling the `SOG_ied_fnc_registerDefuseTask` function in the init field of the task

```js
Arguments:
	0: STRING - ID of the task
	1: SCALAR - Number of objects destroyed to fail the task
	2: SCALAR - Number of ieds to defuse to complete the task
	3: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	4: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

Example:
	["task_name", 2, 3, false] call SOG_ied_fnc_registerDefuseTask
```

## Links
[Home](/knowledgebase/framework) |
[Attack Module](/knowledgebase/framework/attack) |
[Destroy Module](/knowledgebase/framework/destroy) |
[Hostage Module](/knowledgebase/framework/hostage) |
[HVT Module](/knowledgebase/framework/hvt) |
[IED Module](/knowledgebase/framework/ied)