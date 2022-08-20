class CfgPatches {
	class SOG_Audio_F {
		addonRootClass = "SOG";

		requiredAddons[] = {"SOG_Core"};
		units[] = {};
		weapons[] = {};
	};
};

class CfgSounds {
	sounds[] = {};

	#include "\SOG_Audio_F\Hospital\Class01\Exam\Sounds.hpp"
	#include "\SOG_Audio_F\Hospital\Class01\Lecture\Sounds.hpp"
	#include "\SOG_Audio_F\Hospital\Class01\Opening\Sounds.hpp"
	#include "\SOG_Audio_F\Hospital\Class01\Warning\Sounds.hpp"
	#include "\SOG_Audio_F\Hospital\Dialogue\Sounds.hpp"
	#include "\SOG_Audio_F\Hospital\Responses\Sounds.hpp"

	#include "\SOG_Audio_F\Submarine\Sounds.hpp"
};

class CfgSFX {
	class SOGSubmarineDrainingSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineDraining.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineExteriorAmbienceSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineExteriorAmbience.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineFloodingSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineFlooding.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineFloodSirenSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineFloodSiren.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineHatchSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineHatch.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineInteriorAmbienceSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineInteriorAmbience.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineLockoutDoorSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineLockoutDoor.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineEnterExteriorSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineEnterExterior.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};

	class SOGSubmarineValveSFX {
		sounds[] = {"sound0"};
		sound0[] = {"\SOG_Audio_F\Submarine\Sounds\SOGSubmarineValve.ogg", db10, 1, 400, 1, 0, 0, 0};
		empty[] = {"", 0, 0, 0, 0, 0, 0, 0};
	};
};

class CfgSentences {
	class Class01 {
		class Lecture01 {
			file = "\SOG_Audio_F\Hospital\Class01\Lecture\Lecture01.bikb";
			#include "\SOG_Audio_F\Hospital\Class01\Lecture\Lecture01.bikb"
		};
	};
	class Dialogues {
		class Dialogue01 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue01.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue01.bikb"
		};
		class Dialogue02 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue02.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue02.bikb"
		};
		class Dialogue03 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue03.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue03.bikb"
		};
		class Dialogue04 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue04.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue04.bikb"
		};
		class Dialogue05 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue05.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue05.bikb"
		};
		class Dialogue06 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue06.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue06.bikb"
		};
		class Dialogue07 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue07.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue07.bikb"
		};
		class Dialogue08 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue08.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue08.bikb"
		};
		class Dialogue09 {
			file = "\SOG_Audio_F\Hospital\Dialogue\Dialogue09.bikb";
			#include "\SOG_Audio_F\Hospital\Dialogue\Dialogue09.bikb"
		};
	};
};

class CfgVehicles {
	class All;
	class Sound : All {
		author = "SOG";
		mapSize = 1;
		_generalMacro = "Sound";
		scope = 0;
		side = -1;
		animated = 0;
		vehicleClass = "Sounds";
		icon = "iconSound";
		faction = "none";
		editorCategory = "SOG";
		editorSubcategory = "SOG_Audio";
	};

	class SOGSubmarineDraining : Sound {
		scope = 2;
		sound = "SOGSubmarineDrainingSFX";
		displayName = "SOG Submarine Draining SFX";
	};

	class SOGSubmarineExteriorAmbience : Sound {
		scope = 2;
		sound = "SOGSubmarineExteriorAmbienceSFX";
		displayName = "SOG Submarine Exterior Ambience SFX";
	};

	class SOGSubmarineFlooding : Sound {
		scope = 2;
		sound = "SOGSubmarineFloodingSFX";
		displayName = "SOG Submarine Flooding SFX";
	};

	class SOGSubmarineFloodSiren : Sound {
		scope = 2;
		sound = "SOGSubmarineFloodSirenSFX";
		displayName = "SOG Submarine Flood Siren SFX";
	};

	class SOGSubmarineHatch : Sound {
		scope = 2;
		sound = "SOGSubmarineHatchSFX";
		displayName = "SOG Submarine Hatch SFX";
	};

	class SOGSubmarineInteriorAmbience : Sound {
		scope = 2;
		sound = "SOGSubmarineInteriorAmbienceSFX";
		displayName = "SOG Submarine Interior Ambience SFX";
	};

	class SOGSubmarineLockoutDoor : Sound {
		scope = 2;
		sound = "SOGSubmarineLockoutDoorSFX";
		displayName = "SOG Submarine Lockout Door SFX";
	};

	class SOGSubmarineEnterExterior : Sound {
		scope = 2;
		sound = "SOGSubmarineEnterExteriorSFX";
		displayName = "SOG Submarine Enter Exterior SFX";
	};

	class SOGSubmarineValve : Sound {
		scope = 2;
		sound = "SOGSubmarineValveSFX";
		displayName = "SOG Submarine Valve SFX";
	};
};
