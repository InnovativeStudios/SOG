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

execVM "\PDB\PDB_Functions_F\Object\scripts\Server_getObjectInventory.sqf";
execVM "\PDB\PDB_Functions_F\Object\scripts\Server_getObjects.sqf";
execVM "\PDB\PDB_Functions_F\Object\scripts\Server_setObjectInventory.sqf";
execVM "\PDB\PDB_Functions_F\Object\scripts\Server_setObjects.sqf";