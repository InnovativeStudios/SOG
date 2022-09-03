/*
 * Name:	sog_fnc_ambientSound
 * Date:	8/6/2022
 * Version: 1.0
 * Author:  J. Schmidt
 *
 * Description:
 * Create a sound source and play an ambient sfx sound.
 *
 * Parameter(s):
 * 0: Object that the sound source will be created at. <OBJECT> 
 * 1: SFX sound that will play at object location. <STRING>
 * 2: Optional Amount of time before SFX sound will be deleted. <NUMBER>
 */

params ["_unit", "_typeOfWound"];
_counter = 0;
_woundCount = 0;
_wound = [];
_woundType = [];

if (_typeOfWound == "CA") then {
	[_unit] call ace_medical_statemachine_fnc_enteredStateCardiacArrest;

	hint "CA";

} else {

	if (_typeOfWound == "randomWound") then {
		_woundCount = 1 + round random 3;
		_woundType = ["bullet", "grenade", "explosive", "shell", "vehiclecrash", "backblast", "stab", "punch", "falling", "unknown"];
	};

	if (_typeOfWound == "explosionWound") then {
		_woundCount = 1 + round random 4;
		_woundType = ["grenade", "explosive", "shell"];
	};

	if (_typeOfWound == "gunshotWound") then {
		_woundCount = 1 + round random 1;
		_woundType = ["bullet"];
	};

	if (_typeOfWound == "impactWound") then {
		_woundCount = 1 + round random 2;
		_woundType = ["vehiclecrash", "backblast", "punch", "falling"];
	};

	if (_typeOfWound == "stabWound") then {
		_woundCount = 1 + round random 1;
		_woundType = ["stab"];
	};

	while {_counter <= _woundCount} do {
		_bodypart = ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"] call BIS_fnc_selectRandom;
		_size = 0.2 + random 0.6;
		//_amount = 1 + round random 4;
		_wound = _woundType call BIS_fnc_selectRandom;
		[_unit, _size, _bodypart, _wound] call ace_medical_fnc_addDamageToUnit;

		_counter = _counter + 1;
	};
};

waitUntil {(!alive _unit)};

sleep 5;
deleteVehicle _unit;