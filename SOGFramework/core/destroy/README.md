# Hvt
## Description:
_This module adds support for target tasks/missions._

_The mission maker can define target units, the framework will monitor the status of those units._

_A threshold can be set, so the given amount of targets have to be destroyed in order to complete the task._

_The module can also trigger mission complete or mission fail._

## Usage:
1. _Set up the target task_
2. _Place down the target unit(s)_
3. _Call the `SOG_destroy_fnc_makeTarget` function in the targets' init field that links the unit to the destroy task_

```
Arguments:
    0: OBJECT - The AI unit or object
    1: STRING - The ID of the task

Example:
    [this, "t1"] call SOG_destroy_fnc_makeTarget
```

5. _Register the extraction task by calling the `SOG_destroy_fnc_registerDestroyTask` function in the init field of the task_

```
Arguments:
    0: STRING - ID of the task
    1: SCALAR - Number of targets escaped to fail the task
    2: SCALAR - Number of targets destroyed to complete the task
    3: SCALAR - Number of seconds before targets escape ** timeLimit must be set to true **
    4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
    5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
    6: BOOLEAN - Does the task have a time limit (Optional, default: false)

Example:
    ["t2", 3, 2, 30, true] call SOG_destroy_fnc_registerHvtTask
```

## Config:
\-

## Supported mission type(s):
 - Coop
