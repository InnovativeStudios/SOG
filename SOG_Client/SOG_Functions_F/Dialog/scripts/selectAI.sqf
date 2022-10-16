/*
	Name:	sog_fnc_selectAI
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Select AI for dialog.

	Parameter(s):
	0: The AI unit. <OBJECT>
*/

params ["_unit"];
{
	_x disableAI "ALL";
	_x switchMove " ";
	[_x] call SOG_fnc_selectDialog;
} forEach _units;