/*
	Name:	sog_fnc_spawnVictim
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Create victim, set victim position and apply random wound(s).

	Parameter(s):
	0: Victim that is created. <OBJECT> 
	1: Type of wound(s). <STRING>
*/

params ["_object", "_typeOfWound"];
{if ((typeOf _x == "victim0") && (!isPlayer _x)) then {deleteVehicle _x}} forEach allUnits;
_patientType = 0;

_dir = random 360;
_counter = 0;
_woundCount = 0;

grp = createGroup civilian;
_patientType = patientType call BIS_fnc_selectRandom;
_patientType createUnit [getPos _object, grp, "victim0 = this; dostop victim0;"];

[victim0, "AinjPpneMstpSnonWrflDnon"] remoteExec ["switchMove", 0];
victim0 attachTo [_object, [0, 0.125, 0.25]];
victim0 setDir (getDir _object);
victim0 setUnconscious true;
victim0 disableAI "All";

removeAllWeapons victim0;
removeAllItems victim0;
removeAllAssignedItems victim0;
removeUniform victim0;
removeVest victim0;
removeBackpack victim0;
removeHeadgear victim0;
removeGoggles victim0;

[victim0, _typeOfWound] call SOG_fnc_checkVictim;
[victim0, ["End Practice Case", SOG_fnc_Medical, {[victim0] call SOG_fnc_deleteVictim}]] remoteExec ["addAction", 0];
	
hint 'Your Medical Training Dummy Is Ready';