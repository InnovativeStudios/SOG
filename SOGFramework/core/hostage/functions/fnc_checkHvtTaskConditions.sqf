#include "script_component.hpp"

/*
    Author:
        Malbryn
        J. Schmidt

    Description:
        Checks the conditions of the hostage rescue task.

    Arguments:
        0: SCALAR - ID of the PFH
        1: ARRAY - Array of hvts linked to this task
        2: STRING - ID of the task
        3: STRING - Marker name for the extraction zone
        4: SCALAR - Number of hvts or hvts KIA to fail the task
        5: SCALAR - Number of rescued hvts or captured hvts to complete the task
        6: SCALAR - Number of seconds before hvts die or hvts escape to fail the task ** timeLimit must be set to true **
        7: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        8: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
        9: BOOLEAN - Does the task have a time limit (Optional, default: false)

    Example:
        [2, [hvt1, hvt2], "t2", "mrk_extraction", 3, 2, true] call MF_hostage_fnc_checkTaskHvtConditions

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_handle", "_hvts", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_time", ["_endSuccess", false], ["_endFail", false], ["_timeLimit", false]];

private _nearPlayers = [];

// Check the death count
if ({!alive _x} count _hvts >= _limitFail) exitWith {
    [_taskID, "FAILED"] call BFUNC(taskSetState);

    // Stop PFH
    [_handle] call CFUNC(removePerFrameHandler);

    // End the mission if it was enabled
    if (_endFail) then {
        [QEGVAR(end_mission,callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
    };
};

// Check if Capture Hvt and Time Limit
if (_timeLimit) then {
  while {_time > 0} do {
    _time = _time - 1;
    sleep 1;

    if (_hvts findIf {!([_x] call AFUNC(captives,isHandcuffed))} < 0) exitWith {};

    if (_time <= 0) exitWith {
      { deleteVehicle _x } forEach _hvts;
    };
  };
};

// If the task is done, we don't check the zone anymore to save performance
// However we still track the death of the hvts
if (_taskID call BFUNC(taskState) == "SUCCEEDED") exitWith {};

// Count the hvts inside the extraction zone
private _count = {
    _x inArea _extZone;
} count _hvts;

// Check the success limit
if (_count >= _limitSuccess) then {
    [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

    // End the mission if it was enabled
    if (_endSuccess) then {
        [QEGVAR(end_mission,callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
    };
};
