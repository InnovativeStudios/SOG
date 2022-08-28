#include "BIS_AddonInfo.hpp"
#define false 0
#define true !false

class CfgPatches {
	class ocean {
		units[] = {};
		weapons[] = {};
		requiredVersion = 1;
		requiredAddons[] = {"A3_Map_Stratis"};
	};
};

class CfgWorldList {
	class ocean {};
};

class CfgWorlds {
	class Stratis;
	class ocean: Stratis {
		cutscenes[] = {};
		description = "The Ocean";
		worldName = "ocean\ocean.wrp";
		author = "SOG";
		pictureMap = "ocean\ocean.paa";
		pictureShot = "ocean\ocean.paa";

		newRoadsShape = "";

		centerPosition[] = { 2560, 2560 };
		ilsDirection[] = { 0, 0.08, 1 };
		ilsPosition[] = { 0, 0 };
		ilsTaxiIn[] = {};
		ilsTaxiOff[] = {};
		drawTaxiway = false;
		class SecondaryAirports {};
		class ReplaceObjects {};

		class Sounds {
			sounds[] = {};
		};

		class Animation {
			vehicles[] = {};
		};

		minTreesInForestSquare = 2;
		minRocksInRockSquare = 2;

		class Subdivision {};
		class Names {};
	};
};