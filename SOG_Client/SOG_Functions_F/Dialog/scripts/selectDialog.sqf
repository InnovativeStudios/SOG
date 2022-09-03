/*
 * Name:	sog_fnc_dialog
 * Date:	8/6/2022
 * Version: 1.0
 * Author:  J. Schmidt
 *
 * Description:
 * Create a sound source and play an ambient sfx sound.
 *
 * Parameter(s):
 * 0: Vehicle that is being repaired. <OBJECT> 
 * 1: Type of vehicle that is being repaired. <STRING>
 */

params ["_units", "_dialog"];
{
	_x params ["_topic", "_sentence"];
	[_topic, _sentence, nil, false, nil, [_units], 1, false] spawn BIS_fnc_kbTell;
} forEach _dialog;