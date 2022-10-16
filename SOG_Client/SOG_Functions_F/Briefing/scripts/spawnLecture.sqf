/*
	Name:	sog_fnc_spawnLecture
	Date:	8/6/2022
	Version: 1.0
	Author:  J. Schmidt

	Description:
	AI plays a given sentence/conversation.

	Parameter(s):
	0: Unit that is playing the given sentence/conversation. <OBJECT> 
	1: Topic that is being talked about. <STRING>
	2: Sentence partaining to the topic at hand. <STRING>
*/

params ["_unit", "_topic", "_sentence"];
_unit disableAI "ALL";
_unit switchMove " ";
[_topic, _sentence, nil, nil, nil, [_unit], 1, false] spawn BIS_fnc_kbTell;