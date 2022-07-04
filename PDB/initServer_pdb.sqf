if(isNil {
	uiNamespace getVariable "pdb_init"
}) then {
	call compile ("extDB3" callExtension "9:ADD_DATABASE:PDB_DB");
	call compile ("extDB3" callExtension "9:ADD_DATABASE_PROTOCOL:PDB_DB:SQL:SQL");
	uiNamespace setVariable ["pdb_init", true];
};

pdb_map = format["%1", worldName];
pdb_mission = format["%1", missionName];
pdb_allowed_Obj = [
	"Structures_Fences",
	"Jonzie_Objects",
	"Structures_Military",
	"ARP_Objects",
	"ARP_objects",
	"ACE_Logistics_Items",
	"Tents",
	"Ammo",
	"Misc",
	"Garbage",
	"Fortifications",
	"Container",
	"Flag",
	"Furniture",
	"Objects_Airport",
	"Cargo",
	"Dead_bodies",
	"Small_items",
	"Lamps",
	"Military",
	"Signs",
	"signs",
	"Objects_Sports",
	"Training"
];

pdb_blacklist_Obj = [
	"Land_Shoot_House_Wall_F",
	"Land_Shoot_House_Wall_Prone_F",
	"Land_Shoot_House_Wall_Crouch_F",
	"Land_Shoot_House_Wall_Long_F",
	"Land_Shoot_House_Wall_Long_Stand_F",
	"Land_Shoot_House_Wall_Long_Prone_F",
	"Line_short_F",
	"VR_Area_01_circle_4_yellow_F"
];

pdb_allowed_veh = [
	"Car",
	"Helicopter",
	"Motorcycle",
	"Plane",
	"Ship",
	"StaticWeapon",
	"Submarine",
	"TrackedAPC",
	"Tank",
	"WheeledAPC"
];

{
	_vehicleType = typeOf _x;
	_vehicleClass = getText (configFile >> "CfgVehicles" >> _vehicleType >> "vehicleClass");
	_parentVehicleType = (_x call BIS_fnc_objectType) select 1;

	if (_parentVehicleType in pdb_allowed_veh) then {
		clearItemCargoGlobal _x;
		clearBackpackCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
	};
} forEach (vehicles);

// _setInterface = [pdb_template_interface] execVM "\PDB\PDB_Functions_F\Template\scripts\Server_load_template_actions.sqf";
// waitUntil{
// 	scriptDone _setInterface
// };


_sql_res = "extDB3" callExtension format["0:SQL:SELECT * FROM mission WHERE missionMap = '%1' AND missionName = '%2'", pdb_map, pdb_mission];
_sql_res = _sql_res splitString "[, ]";

if (count _sql_res < 2) then {
	"extDB3" callExtension format["0:SQL:INSERT INTO mission SET missionMap = '%1', missionName = '%2', missionLoaded = NOW()", pdb_map, pdb_mission];
	_sql_res = "extDB3" callExtension format["0:SQL:SELECT * FROM mission WHERE missionMap = '%1' AND missionName = '%2'", pdb_map, pdb_mission];
	_sql_res = _sql_res splitString "[, ]";
	pdb_mission_fk = (_sql_res select 1);
	publicVariable "pdb_mission_fk";

	_setVeh = [] execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicle.sqf";
	waitUntil{
		scriptDone _setVeh
	};

	_setObj = [] execVM "\PDB\PDB_Functions_F\Object\scripts\Server_setObjects.sqf";
	waitUntil{
		scriptDone _setObj
	};
} else {
	pdb_mission_fk = (_sql_res select 1);
	publicVariable "pdb_mission_fk";
	"extDB3" callExtension format["0:SQL:UPDATE mission SET missionLoaded = NOW() WHERE id = '%1'", pdb_mission_fk];

	_getVeh = [] execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicle.sqf";
	waitUntil{
		scriptDone _getVeh
	};

	_getObj = [] execVM "\PDB\PDB_Functions_F\Object\scripts\Server_getObjects.sqf";
	waitUntil{
		scriptDone _getObj
	};
};

// _markers = [] execVM "\PDB\PDB_Functions_F\Misc\scripts\Server_getMarkers.sqf";
// waitUntil{
// 	scriptDone _markers
// };


pdb_cnt = 59;
publicVariable "pdb_cnt";

while { true } do {
	pdb_cnt = pdb_cnt + 1;

	sleep 1;
	// _null = [] execVM "\PDB\PDB_Functions_F\Misc\scripts\Server_resupply.sqf";
	_setVehicle = [] execVM "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicle.sqf";

	{
		_setUnit = [_x] execVM "\PDB\PDB_Functions_F\Unit\scripts\Server_setUnit.sqf";
		waitUntil{
			scriptDone _setUnit
		};
	} forEach allPlayers;

	sleep 59;

	if (pdb_cnt >= 60) then {
		_setObj = [] execVM "\PDB\PDB_Functions_F\Object\scripts\Server_setObjects.sqf";
		waitUntil{
			scriptDone _setObj
		};
		[] execVM "\PDB\PDB_Functions_F\Misc\scripts\Server_cleanupDB.sqf";
		pdb_cnt = 0;
	};
};