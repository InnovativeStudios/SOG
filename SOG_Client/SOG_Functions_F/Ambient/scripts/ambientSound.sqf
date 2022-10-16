/*
	Name:	sog_fnc_ambientSound
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Create a sound source and play an ambient sfx sound.

	Parameter(s):
	0: Object that the sound source will be created at. <OBJECT> 
	1: SFX sound that will play at object location. <STRING>
	2: Optional Amount of time before SFX sound will be deleted. <NUMBER>
*/

params ["_source", "_sfx", "_time"];
private ["_pos", "_sound0"];

_pos = getPos _source;
_sound0 = createSoundSource [_source, _pos, [], 0];

if (!isNil _time) then {
	uiSleep _time;
	deleteVehicle _sound0;
};

if (!alive _source) then {
	deleteVehicle _sound0;
};
