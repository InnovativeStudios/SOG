/************			************			************			************			************
*
*
*		// Called From Init.sqf or InitServer.sqf
*		[] call SOG_FNC_Soundscape;
*
*		// Infinite Loop
*		[] spawn { waitUntil { sleep 1; !isNil "SOG_FNC_Soundscape" }; [object, "NameOfSFXSound", NumberOfSec] call SOGAmbientSoundLoop; };
*
*		// Loop W/Sleep
*		[object, "NameOfSFXSound", NumberOfSec] spawn SOGAmbientSoundLoopWSleep;
*
*		// Examples
*		[] spawn { waitUntil { sleep 1; !isNil "SOG_FNC_Soundscape" }; [SOGSubmarineExterior, "SOGSubmarineExteriorAmbience", 300] call SOGAmbientSoundLoop; };
*		[SOGSubmarineFloodSiren, "SOGSubmarineFloodSiren", 30] spawn SOGAmbientSoundLoopWSleep;
*
*
************			************			************			************			************/

execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Client_getVehicle.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Client_setVehicle.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicle.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicleHitpointDamage.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicleInventory.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setSingleVehicle.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicle.sqf";
execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicleInventory.sqf";