#include "script_component.hpp"

/*
    Author:
        Malbryn
        J. Schmidt

    Description:
        Registers a task as a capture type of task.

    Arguments:
        0: STRING - ID of the task
        1: STRING - Marker name for the extraction zone
        2: SCALAR - Number of hvts KIA to fail the task
        3: SCALAR - Number of captured hvts to complete the task
        4: NUMBER - Number of seconds before hvts escape to fail the task ** timeLimit must be enabled **
        5: BOOLEAN - Should the task have a time limit (Optional, default: false)
        4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

    Example:
        ["t2", "mrk_extraction", 3, 2, false, true] call MF_hostage_fnc_registerRescueTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_time", -1], ["_timeLimit", false], ["_endSuccess", false], ["_endFail", false] ];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
    _thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_time", "_timeLimit", "_endSuccess", "_endFail"];

    // Check stuff
    if (getMarkerType _extZone == "") then {
        [COMPONENT_STR, "WARNING", format ["Marker (%1) does not exist", _extZone], false, 0] call EFUNC(main,log);
    };

    if !([_taskID] call BFUNC(taskExists)) then {
        [COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main,log);
    };

    if (_limitSuccess > count GVAR(allHostages)) then {
        [COMPONENT_STR, "WARNING", format [
            "Required number of hvts to rescue (set to %1) is higher than the hostage count (current: %2)", _limitSuccess, count GVAR(allHostages)
        ], true, 0] call EFUNC(main,log);
    };

    // Get the hvts
    private _hvts = GVAR(allHVTs) select {GETVAR(_x,GVAR(assignedTask),"") == _taskID};

    // PFH
    private _handle = [{
        _this#0 params ["_hvts", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_type", "_time"];
        _this#1 params ["_handle"];

        // Check function
        [_handle, _hvts, _taskID, _extZone, _limitFail, _limitSuccess, _time, _timeLimit, _endSuccess, _endFail] spawn FUNC(checkHvtTaskConditions);
    }, 3, [_hvts, _taskID, _extZone, _limitFail, _limitSuccess, _time, _timeLimit, _endSuccess, _endFail]] spawn CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _time, _timeLimit, _endSuccess, _endFail]] spawn CFUNC(addEventHandlerArgs);
