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
        2: STRING - ID of the task
        3: STRING - Marker name for the extraction zone
        4: SCALAR - Number of hostages KIA to fail the task
        5: SCALAR - Number of rescued hostages to complete the task
        6: BOOLEAN - Should the mission end (MissionSuccess) if the task is successful (Optional, default: false)
        7: BOOLEAN - Should the mission end (MissionFailed) if the task is failed (Optional, default: false)

    Example:
        [2, [pow1, pow2], [hvt1, hvt2], "t2", "mrk_extraction", 3, 2, 30, true, false, [true, false, true, false]] call MF_hostage_fnc_checkTaskConditions

    Returns:
        void
*/

if !(isServer) exitWith {};

params ["_handle", "_hostages", "_hvts", "_shooters", "_taskID", "_extZone", "_limitFail", "_limitSuccess", "_time", ["_type", [["_timeLimit", false], ["_capture", false], ["_cbrn", false], ["_hostage", false]]], ["_endSuccess", false], ["_endFail", false]];

private _nearPlayers = [];
private _timeLimit = _this select 9 select 0;
private _capture = _this select 9 select 1;
private _cbrn = _this select 9 select 2;
private _hostage = _this select 9 select 3;

// Check the death count
if ({!alive _x} count _hostages >= _limitFail || {!alive _x} count _hvts >= _limitFail) exitWith {
    [_taskID, "FAILED"] call BFUNC(taskSetState);

    // Stop PFH
    [_handle] call CFUNC(removePerFrameHandler);

    // End the mission if it was enabled
    if (_endFail) then {
        [QEGVAR(end_mission,callMission), ["MissionFail", false, playerSide]] call CFUNC(serverEvent);
    };
};

// Check if Capture Hostage and Time Limit
if (_timeLimit && _capture) then {
  while {_time > 0} do {
    _time = _time - 1;
    sleep 1;

    if (_hvts findIf {!([_x] call AFUNC(captives,isHandcuffed))} < 0) exitWith {};

    if (_time <= 0) exitWith {
      { _x deleteVehicle } forEach _hvts
    }
  }
};

// Check if CBRN Attack and Time Limit
if (_timeLimit && _cbrn) then {
  while {_time > 0} do {
    _time = _time - 1;
    sleep 1;

    if (_time <= 0) exitWith {
      { _x setDamage 0.9 } forEach _hostages;
      { _x playMove "acts_executionvictim_kill_end" } forEach _hostages;

      sleep 2.75;

      { _x setDamage 1 } forEach _hostages
    }
  }
};

// Check if Hostage Rescue and Time Limit
if (_timeLimit && _hostage) then {
  while {_time > 0} do {
    _time = _time - 1;
    sleep 1;

    if (_time <= 0) exitWith {
      { _x playMove "acts_executioner_kill_end" } forEach _shooters;

      sleep 2;

      playSound "sn_flare_weapon_fired";
      { _x playMove "acts_executioner_standingloop" } forEach _shooters;
      { _x setDamage 0.9 } forEach _hostages;
      { _x playMove "acts_executionvictim_kill_end" } forEach _hostages;

      sleep 2.75;

      { _x setDamage 1 } forEach _hostages
    }
  }
};

// If the task is done, we don't check the zone anymore to save performance
// However we still track the death of the hostages
if (_taskID call BFUNC(taskState) == "SUCCEEDED") exitWith {};

// Count the hostages inside the extraction zone
private _countHostages = {
    _x inArea _extZone;
} count _hostages;

// Count the hvts inside the extraction zone
private _countHVTs = {
    _x inArea _extZone;
} count _hvts;

// Check the success limit
if (_countHostages >= _limitSuccess || _countHVTs >= _limitSuccess) then {
    [_taskID, "SUCCEEDED"] call BFUNC(taskSetState);

    // End the mission if it was enabled
    if (_endSuccess) then {
        [QEGVAR(end_mission,callMission), ["MissionSuccess", true, playerSide]] call CFUNC(serverEvent);
    };
};
