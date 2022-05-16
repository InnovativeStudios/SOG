#include "script_component.hpp"

/*
    Author:
        Malbryn
        J. Schmidt

    Description:
        Registers a task as a hostage type of task.

    Arguments:
        0: STRING - ID of the task
        1: STRING - Marker name for the extraction zone
        2: SCALAR - Number of hostages KIA to fail the task
        3: SCALAR - Number of rescued hostages to complete the task
        4: SCALAR - Number of seconds before hostages are killed ** timeLimit must be set to true **
        5: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        6: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
        7: BOOLEAN - Does the task have a time limit (Optional, default: false)
        8: ARRAY - Array of task types to select and set task to (Optional, default: [false, false])

    Example:
        ["t2", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_registerRescueTask
        ["t2", "mrk_extraction", 3, 2, 45, true, false, true, [true, false]] call MF_hostage_fnc_registerRescueTask

    Returns:
        void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_time", -1], ["_endSuccess", false], ["_endFail", false], ["_timeLimit", false], ["_type", [["_cbrn", false], ["_hostage", false]]]];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
    _thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_time", "_endSuccess", "_endFail", "_timeLimit", "_type"];

    // Check stuff
    if (getMarkerType _extZone == "") then {
        [COMPONENT_STR, "WARNING", format ["Marker (%1) does not exist", _extZone], false, 0] call EFUNC(main,log);
    };

    if !([_taskID] call BFUNC(taskExists)) then {
        [COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main,log);
    };

    if (_limitSuccess > count GVAR(allHostages)) then {
        [COMPONENT_STR, "WARNING", format [
            "Required number of hostages to rescue (set to %1) is higher than the hostage count (current: %2)", _limitSuccess, count GVAR(allHostages)
        ], true, 0] call EFUNC(main,log);
    };

    // Get the hostages
    private _hostages = GVAR(allHostages) select {GETVAR(_x,GVAR(assignedTask),"") == _taskID};

    // Get the shooters
    private _shooters = GVAR(allShooters) select {GETVAR(_x,GVAR(assignedTask),"") == _taskID};

    // PFH
    private _handle = [{
        _this#0 params ["_hostages", "_shooters", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_time", "_endSuccess", "_endFail", "_timeLimit", "_type"];
        _this#1 params ["_handle"];

        // Check function
        [_handle, _hostages, _shooters, _taskID, _extZone, _limitFail, _limitSuccess, _time, _endSuccess, _endFail, _timeLimit, _type] spawn FUNC(checkHostageTaskConditions);
    }, 3, [_hostages, _shooters, _taskID, _extZone, _limitFail, _limitSuccess, _time, _endSuccess, _endFail, _timeLimit, _type]] spawn CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _time, _endSuccess, _endFail, _timeLimit, _type]] spawn CFUNC(addEventHandlerArgs);
