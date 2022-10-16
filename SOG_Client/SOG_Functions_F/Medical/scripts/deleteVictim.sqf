/*
	Name:	sog_fnc_deleteVictim
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Delete victim.

	Parameter(s):
	0: The AI unit. <OBJECT>
*/

params ["_unit"];
_unit setDamage 1;
deleteVehicle _unit;