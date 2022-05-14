#include "script_component.hpp"

/*
    Author:
        J. Schmidt

    Description:
        Handcuffs an AI unit and registers it as a hostage/POW.

    Arguments:
        0: OBJECT - The object
        1: STRING - The ID of the task

    Example:
        [this, "t1"] call SOG_ied_fnc_makeIED

    Returns:
        void
*/

params [["_ied", objNull], ["_taskID", ""]];

// Check stuff
if (isNull _ied) exitWith {[COMPONENT_STR, "ERROR", "IED is not found", true] call EFUNC(main,log)};
if (_taskID == "") exitWith {[COMPONENT_STR, "ERROR", "Task ID is empty", true] call EFUNC(main,log)};

// Handcuff
[_ied, true] call AFUNC(captives,setHandcuffed);

// Register hostage
SETVAR(_ied,GVAR(assignedTask),_taskID);
private _index = GVAR(allIEDs) pushBackUnique _ied;

// Log
[COMPONENT_STR, "DEBUG", format [
    "Object (%1) is registered as an IED. IED array: %2", _ied, str GVAR(allIEDs)
]] call EFUNC(main,log);

if (_index == -1) then {
    [COMPONENT_STR, "WARNING", format ["Object (%1) is already an IED", _ied], true] call EFUNC(main,log);
};
