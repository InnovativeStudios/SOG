#include "script_component.hpp"

/*
    Author:
        Malbryn
        J. Schmidt

    Description:
        Checks the conditions of the hostage rescue task.

    Arguments:
        0: SCALAR - ID of the PFH
        1: ARRAY - Array of the targets linked to this task
        2: STRING - ID of the task
        3: SCALAR - Number of targets escaped to fail the task
        4: SCALAR - Number of targets destroyed to complete the task
        5: SCALAR - Number of seconds before targets escape to fail the task ** timeLimit must be set to true **
        6: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        7: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
        8: BOOLEAN - Does the task have a time limit (Optional, default: false)


    Example:
        [2, [target1, target2], "t2", 1, 2, 30, true] call MF_destroy_fnc_checkTaskConditions

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_handle", "_targets", "_taskID", "_limitFail", "_limitSuccess", "_time", ["_endSuccess", false], ["_endFail", false], ["_timeLimit", false]];

// Check if Time Limit
if (_timeLimit) then {
  // Check if type Eliminate
  if (_eliminate) then {
    while {_time > 0} do {
      _time = _time - 1;
      sleep 1;

      // Check the success limit
      if ({ !alive _x } count _targets >= _limitSuccess) exitWith {
        [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

        // End the mission if it was enabled
        if (_endSuccess) then {
            [QEGVAR(end_mission,callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
        };
      };

      // Check if Time has exceeded and targets KIA
      if (_time <= 0 && { alive _x } count _targets >= _limitFail) exitWith {
        [_taskID, "FAILED"] call BFUNC(taskSetState);

        // End the mission if it was enabled
        if (_endFail) then {
            [QEGVAR(end_mission,callMission), ["MissionFail", true, playerSide]] call CFUNC(serverEvent);
        };

        // Remove targets
        { deleteVehicle _x } forEach _targets;
      };
    };
  };
} else {
  // Check if type Eliminate
  if (_eliminate) then {
    // If the task is done, we don't check the task anymore to save performance
    if (_taskID call BFUNC(taskState) == "SUCCEEDED") exitWith {};

    // Check the success limit
    if ({ !alive _x } count _targets >= _limitSuccess) then {
      [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

      // End the mission if it was enabled
      if (_endSuccess) then {
          [QEGVAR(end_mission,callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
      };
    };
  };
};
