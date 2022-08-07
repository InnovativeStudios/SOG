/*
 * Name:	sog_fnc_init
 * Date:	8/6/2022
 * Version: 1.0
 * Author:  J. Schmidt
 *
 * Description:
 * Create a sound source and play an ambient sfx sound.
 *
 * Parameter(s):
 * 0: Object that the sound source will be created at. <OBJECT>
 * 1: SFX sound that will play at object location. <STRING>
 * 2: Optional Amount of time before SFX sound will be deleted. <NUMBER>
 *
 * Example(s):
 * [SOGSubmarineExterior, "SOGSubmarineExteriorAmbience"] call SOGAmbientSound;
 * [SOGSubmarineFloodSiren, "SOGSubmarineFloodSiren", 30] spawn SOGAmbientSound;
 */

execVM "\SOG\SOG_Functions_F\AmbientSound\scripts\ambientSound.sqf";
