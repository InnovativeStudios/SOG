#include "script_component.hpp"

/*
	Author:
	Malbryn
	J. Schmidt
	
	Description:
	Registers a task as a hvt type of task.
	
	Arguments:
	0: STRING - ID of the task
	1: STRING - Marker name for the extraction zone
	2: SCALAR - Number of hvts KIA or escaped to fail the task
	3: SCALAR - Number of hvts caputred or eliminated to complete the task
	5: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	6: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	8: ARRAY - Array of task types to select and set task to (Optional, default: [false, true])
	7: BOOLEAN - Does the task have a time limit (Optional, default: false)
	4: SCALAR - Number of seconds before hvts are killed (Optional, default: 45) ** timeLimit Must Be Enabled **
	
	Example:
	// Capture HVT No Time Limit
	["task_name", "marker_name", 1, 2, false, false, [true, false]] call MF_hvt_fnc_registerHvtTask
	
	// Eliminate HVT No Time Limit
	["task_name", "marker_name", 1, 2, false, false, [false, true]] call MF_hvt_fnc_registerHvtTask
	
	// Capture HVT Within Time Limit
	["task_name", "marker_name", 1, 2, false, false, [true, false], true, 45] call MF_hvt_fnc_registerHvtTask
	
	// Eliminate HVT Within Time Limit
	["task_name", "marker_name", 1, 2, false, false, [false, true], true, 45] call MF_hvt_fnc_registerHvtTask
	
	Returns:
	void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_endSuccess", false], ["_endFail", false], ["_type", [["_capture", false], ["_eliminate", true]]], ["_timeLimit", false], ["_time", 45]];

// Add a PFH to each task
// Delay the PFH until mission start so every hvt is initialised
[QGVARMAIN(initFramework), {
	_thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_type", "_timeLimit", "_time"];

	// Check stuff
	if (getMarkerType _extZone == "") then {
		[COMPONENT_STR, "WARNING", format ["Marker (%1) does not exist", _extZone], false, 0] call EFUNC(main, log);
	};

	if !([_taskID] call BFUNC(taskExists)) then {
		[COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main, log);
	};

	if (_limitSuccess > count GVAR(allHVTs)) then {
		[COMPONENT_STR, "WARNING", format [
			"Required number of hvts to capture or eliminate (set to %1) is higher than the hvt count (current: %2)", _limitSuccess, count GVAR(allHVTs)
		], true, 0] call EFUNC(main, log);
	};

	// get the hvts
	private _hvts = GVAR(allHVTs) select {
		GETVAR(_x, GVAR(assignedTask), "") == _taskID
	};

	// PFH
	private _handle = [{
		_this#0 params ["_hvts", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_type", "_timeLimit", "_time"];
		_this#1 params ["_handle"];

		// Check function
		[_handle, _hvts, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time] spawn FUNC(checkTaskConditions);
	}, 3, [_hvts, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time]] spawn CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time]] spawn CFUNC(addEventHandlerArgs);