#include "script_component.hpp"

/*
    Author:
        J. Schmidt

    Description:
        Start Countdown Timer, take an object and register it as an IED.

    Arguments:
        0: OBJECT - The object
        1: STRING - The ID of the task
        2: Number - The Countdown Timer

    Example:
        [this, "t2", 30] spawn SOG_ied_fnc_makeIED

    Returns:
        void
*/

params [["_ied", objNull], ["_taskID", ""], "_time"];

// Check stuff
if (isNull _ied) exitWith {[COMPONENT_STR, "ERROR", "IED is not found", true] call EFUNC(main,log)};
if (_taskID == "") exitWith {[COMPONENT_STR, "ERROR", "Task ID is empty", true] call EFUNC(main,log)};

// Countdown Timer
while { _time > 0 } do {
  _time = _time -1;
  sleep 1;

  hintSilent parseText format ["<t size='2' color='#ff0000' shadow='2'>%1</t>", _time];

  if ({ alive _x } count _ied <= 0) exitWith {};

  {
    if (alive _x) exitWith {
      if (_time > 10) exitWith { _x say3D "timer_beep" };
      if (_time <= 10 && _time > 5) exitWith { _x say3D "timer_beep_short" };
      if (_time <= 5) exitWith { _x say3D "timer_end" };
    }
  } forEach _ied;

  if (_time <= 0 && { alive _x } count _ied > 0) exitWith {
    {
      _x setDamage 1
    } forEach _ied
  }
};

hint "";

// Register ied
SETVAR(_ied,GVAR(assignedTask),_taskID);
private _index = GVAR(allIEDs) pushBackUnique _ied;

// Log
[COMPONENT_STR, "DEBUG", format [
    "Object (%1) is registered as an IED. IED array: %2", _ied, str GVAR(allIEDs)
]] call EFUNC(main,log);

if (_index == -1) then {
    [COMPONENT_STR, "WARNING", format ["Object (%1) is already an IED", _ied], true] call EFUNC(main,log);
};
