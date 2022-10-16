/*
	Name:	sog_fnc_checkRain
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	Check if there is rain and do something.

	Parameter(s):
	Null
*/

_rainLevel = rain;
waituntil {(_rainLevel > 0)};

// Commands to execute once it starts to rain