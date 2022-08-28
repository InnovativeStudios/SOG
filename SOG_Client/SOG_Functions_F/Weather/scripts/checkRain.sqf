/*
 * Name:	sog_fnc_serviceVehicle
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

_rainLevel = rain;
waituntil {(_rainLevel > 0)};

// Commands to execute once it starts to rain