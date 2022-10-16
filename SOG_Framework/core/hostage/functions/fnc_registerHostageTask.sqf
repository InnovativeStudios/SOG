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
	5: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	6: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	8: ARRAY - Array of task types to select and set task to (Optional, default: [false, false])
	7: BOOLEAN - Does the task have a time limit (Optional, default: false)
	4: SCALAR - Number of seconds before hostages are killed (Optional, default: 45) ** timeLimit Must Be Enabled **
	
	Example:
	// Default No Time Limit
	["task_name", "marker_name", 1, 2, false] call SOG_hostage_fnc_registerHostageTask
	
	// CBRN Attack When Time Limit Expires
	["task_name", "marker_name", 1, 2, false, false, [true, false], true, 45] spawn SOG_hostage_fnc_registerHostageTask
	
	// Execution When Time Limit Expires
	["task_name", "marker_name", 1, 2, false, false, [false, true], true, 45] spawn SOG_hostage_fnc_registerHostageTask
	
	Returns:
	void
*/

if !(isServer) exitWith {};

params [["_taskID", ""], ["_extZone", ""], ["_limitFail", -1], ["_limitSuccess", -1], ["_endSuccess", false], ["_endFail", false], ["_type", [["_cbrn", false], ["_hostage", false]]], ["_timeLimit", false], ["_time", 45]];

// Add a PFH to each task
// Delay the PFH until mission start so every hostage is initialised
[QGVARMAIN(initFramework), {
	_thisArgs params ["_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_type", "_timeLimit", "_time"];

	// Check stuff
	if (getMarkerType _extZone == "") then {
		[COMPONENT_STR, "WARNING", format ["Marker (%1) does not exist", _extZone], false, 0] call EFUNC(main, log);
	};

	if !([_taskID] call BFUNC(taskExists)) then {
		[COMPONENT_STR, "DEBUG", format ["Task (%1) does not exist", _taskID], true, 0] call EFUNC(main, log);
	};

	if (_limitSuccess > count GVAR(allHostages)) then {
		[COMPONENT_STR, "WARNING", format [
			"Required number of hostages to rescue (set to %1) is higher than the hostage count (current: %2)", _limitSuccess, count GVAR(allHostages)
		], true, 0] call EFUNC(main, log);
	};

	// Get the hostages
	private _hostages = GVAR(allHostages) select {
		GETVAR(_x, GVAR(assignedTask), "") == _taskID
	};

	// Get the shooters
	private _shooters = GVAR(allShooters) select {
		GETVAR(_x, GVAR(assignedTask), "") == _taskID
	};

	// PFH
	private _handle = [{
		_this#0 params ["_hostages", "_shooters", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_endSuccess", "_endFail", "_type", "_timeLimit", "_time"];
		_this#1 params ["_handle"];

		// Check function
		[_handle, _hostages, _shooters, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time] spawn FUNC(checkTaskConditions);
	}, 3, [_hostages, _shooters, _taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time]] spawn CFUNC(addPerFrameHandler);
}, [_taskID, _extZone, _limitFail, _limitSuccess, _endSuccess, _endFail, _type, _timeLimit, _time]] spawn CFUNC(addEventHandlerArgs);