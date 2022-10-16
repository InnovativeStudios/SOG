/*
	Name:	sog_fnc_selectDialog
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Create dialog for AI unit.

	Parameter(s):
	0: The AI unit. <OBJECT>
	1: The dialog to be used. <STRING>
*/

params ["_units", "_dialog"];
{
	_x params ["_topic", "_sentence"];
	[_topic, _sentence, nil, false, nil, [_units], 1, false] spawn BIS_fnc_kbTell;
} forEach _dialog;