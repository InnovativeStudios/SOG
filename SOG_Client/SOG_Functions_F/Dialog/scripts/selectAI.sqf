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

params ["_unit"];
{
	_x disableAI "ALL";
	_x switchMove " ";
	[_x] call SOGSelectDialog;
} forEach _units;