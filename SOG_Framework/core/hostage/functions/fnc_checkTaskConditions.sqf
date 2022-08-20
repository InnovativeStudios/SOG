#include "script_component.hpp"

/*
	Author:
	Malbryn
	J. Schmidt
	
	Description:
	Checks the conditions of the hostage rescue task.
	
	Arguments:
	0: SCALAR - ID of the PFH
	1: ARRAY - Array of the hostages linked to this task
	2: ARRAY - Array of shooters linked to this task
	3: STRING - ID of the task
	4: STRING - Marker name for the extraction zone
	5: SCALAR - Number of hostages KIA to fail the task
	6: SCALAR - Number of hostages rescued to complete the task
	7: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
	8: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)
	9: ARRAY - Array of task type to select from (Optional, default: [false, false])
	10: BOOLEAN - Does the task have a time limit (Optional, default: false)
	11: time - Number of seconds before hostages die to fail the task (Optional, default: 45) ** timeLimit Must Be Enabled **
	
	
	Example:
	// Default No Time Limit
	[1, [pow1, pow2], "t1", "mrk_extraction", 1, 2, false] call MF_hostage_fnc_checkTaskConditions
	
	Returns:
	void
*/

if !(isServer) exitWith {};

params ["_handle", "_hostages", "_shooters", "_taskID", "_extZone", "_limitFail", "_limitSuccess", ["_endSuccess", false], ["_endFail", false], ["_type", [["_cbrn", false], ["_hostage", false]]], ["_timeLimit", false], "_time"];

private _nearPlayers = [];
private _cbrn = _this select 9 select 0;
private _hostage = _this select 9 select 1;

// Check the death count
if ({
	!alive _x
} count _hostages >= _limitFail) exitWith {
	[_taskID, "FAILED"] call BFUNC(taskSetState);

	// stop PFH
	[_handle] call CFUNC(removePerFrameHandler);

	// End the mission if it was enabled
	if (_endFail) then {
		[QEGVAR(end_mission, callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
	};
};

// If the task is done, we don't check the zone anymore to save performance
// However we still track the death of the hostages
if (_taskID call BFUNC(taskState) == "SUCCEEDED") exitWith {};

// Check if time Limit
if (_timeLimit) then {
	// Check if type CBRN
	if (_cbrn) then {
		while { _time > 0 } do {
			_time = _time - 1;
			sleep 1;

			if (_time <= 0) exitWith {
				{
					_x setDamage 0.9
				} forEach _hostages;
				{
					_x playMove "acts_executionvictim_kill_end"
				} forEach _hostages;

				sleep 2.75;

				{
					_x setDamage 1
				} forEach _hostages;
			};
		};
	};

	// Check if type Hostage
	if (_hostage) then {
		while { _time > 0 } do {
			_time = _time - 1;
			sleep 1;

			if (_time <= 0) exitWith {
				{
					_x enableAIFeature ["MOVE", true]
				} forEach _shooters;
				{
					_x playMove ""
				} forEach _shooters;

				sleep 1;

				{
					_x setCaptive false
				} forEach _hostages;
			};
		};
	};
};

// Check the success limit
if ({
	_x inArea _extZone
} count _hostages >= _limitSuccess) exitWith {
	[_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

	// End the mission if it was enabled
	if (_endSuccess) then {
		[QEGVAR(end_mission, callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
	};
};