#include "script_component.hpp"

/*
	Author:
	Malbryn
	J. Schmidt
	
	Description:
	Registers a task as a destroy type of task.
	
	Arguments:
	0: STRING - ID of the task
	1: SCALAR - Number of targets escaped to fail the task
	2: SCALAR - Number of targets destroyed to complete the task
	4: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	5: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	6: BOOLEAN - Does the task have a time limit (Optional, default: false)
	3: TIME - Number of seconds before targets escape (Optional, default: 45) ** timeLimit Must Be Enabled **
	
	Example:
	// Default No Time Limit
	["task_name", 1, 2, false] call SOG_destroy_fnc_registerDestroyTask
	
	// Destroy Within Time Limit
	["task_name", 1, 2, false, false, true, 45] call SOG_destroy_fnc_registerDestroyTask
	
	Returns:
	void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_endSuccess", false], ["_endFail", false], ["_timeLimit", false], ["_time", 45]];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
	_thisArgs params ["_taskID", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_timeLimit", "_time"];

	// Check stuff
	if !([_taskID] call BFUNC(taskExists)) then {
		[COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main, log);
	};

	if (_limitSuccess > count GVAR(allTargets)) then {
		[COMPONENT_STR, "WARNING", format [
			"Required number of targets to destroy (set to %1) is higher than the target count (current: %2)", _limitSuccess, count GVAR(allTargets)
		], true, 0] call EFUNC(main, log);
	};

	// Get the targets
	private _targets = GVAR(allTargets) select {
		GETVAR(_x, GVAR(assignedTask), "") == _taskID
	};

	// PFH
	private _handle = [{
		_this#0 params ["_targets", "_taskID", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_timeLimit", "_time"];
		_this#1 params ["_handle"];

		// Check function
		[_handle, _targets, _taskID, _limitFail, _limitSuccess, _endSuccess, _endFail, _timeLimit, _time] spawn FUNC(checkTaskConditions);
	}, 3, [_targets, _taskID, _limitFail, _limitSuccess, _endSuccess, _endFail, _timeLimit, _time]] spawn CFUNC(addPerFrameHandler);
}, [_taskID, _limitFail, _limitSuccess, _endSuccess, _endFail, _timeLimit, _time]] spawn CFUNC(addEventHandlerArgs);