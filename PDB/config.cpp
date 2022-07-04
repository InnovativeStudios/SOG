class CfgPatches {
	class PDB_Functions_F {
		addonRootClass = "PDB";
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F"};
	};
};

class CfgFunctions {
	class PDB {
		class Misc {
			class debug {
				file = "\PDB\PDB_Functions_F\Misc\scripts\debug.sqf";
			};
			class Server_cleanupDB {
				file = "\PDB\PDB_Functions_F\Misc\scripts\Server_cleanupDB.sqf";
			};
			class Server_deleteVehicle {
				file = "\PDB\PDB_Functions_F\Misc\scripts\Server_deleteVehicle.sqf";
			};
		};

		class Object {
			class Server_getObjectInventory {
				file = "\PDB\PDB_Functions_F\Object\scripts\Server_getObjectInventory.sqf";
			};
			class Server_getObjects {
				file = "\PDB\PDB_Functions_F\Object\scripts\Server_getObjects.sqf";
			};
			class Server_setObjectInventory {
				file = "\PDB\PDB_Functions_F\Object\scripts\Server_setObjectInventory.sqf";
			};
			class Server_setObjects {
				file = "\PDB\PDB_Functions_F\Object\scripts\Server_setObjects.sqf";
			};
		};

		class Unit {
			class Client_getUnit {
				file = "\PDB\PDB_Functions_F\Unit\scripts\Client_getUnit.sqf";
			};
			class Server_getUnit {
				file = "\PDB\PDB_Functions_F\Unit\scripts\Server_getUnit.sqf";
			};
			class Server_setUnit {
				file = "\PDB\PDB_Functions_F\Unit\scripts\Server_setUnit.sqf";
			};
		};

		class Vehicle {
			class Client_getVehicle {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Client_getVehicle.sqf";
			};
			class Client_setVehicle {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Client_setVehicle.sqf";
			};
			class Server_getVehicle {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicle.sqf";
			};
			class Server_getVehicleHitpointDamage {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicleHitpointDamage.sqf";
			};
			class Server_getVehicleInventory {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_getVehicleInventory.sqf";
			};
			class Server_setSingleVehicle {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setSingleVehicle.sqf";
			};
			class Server_setVehicle {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicle.sqf";
			};
			class Server_setVehicleInventory {
				file = "\PDB\PDB_Functions_F\Vehicle\scripts\Server_setVehicleInventory.sqf";
			};
		};
	};
};