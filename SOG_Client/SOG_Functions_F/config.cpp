class CfgPatches {
  class SOG_Functions_F {
    addonRootClass = "SOG Client";
    units[] = {};
    requiredVersion = 1.0;
    requiredAddons[] = {"A3_Modules_F"};
  };
};

class CfgFunctions {
  class SOG_Client {
    class Ambient {
      class ambientSound {
        file = "\SOG_Client\SOG_Funtions_F\Ambient\scripts\ambientSound.sqf";
      };
    };

    class Briefing {
      class endSlideShow {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\endSlideShow.sqf";
      };
      class initSlideShow {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\initSlideShow.sqf";
      };
      class nextImage {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\nextImage.sqf";
      };
      class prevImage {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\prevImage.sqf";
      };
      class spawnLecture {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\spawnLecture.sqf";
      };
      class spawnPresentation {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\spawnPresentation.sqf";
      };
      class startSlideShow {
        file = "\SOG_Client\SOG_Funtions_F\Briefing\scripts\startSlideShow.sqf";
      };
    };

    class Dialog {
      class selectAI {
        file = "\SOG_Client\SOG_Funtions_F\Dialog\scripts\selectAI.sqf";
      };
      class selectDialog {
        file = "\SOG_Client\SOG_Funtions_F\Dialog\scripts\selectDialog.sqf";
      };
    };

    class Medical {
      class checkVictim {
        file = "\SOG_Client\SOG_Funtions_F\Medical\scripts\checkVictim.sqf";
      };
      class deleteVictim {
        file = "\SOG_Client\SOG_Funtions_F\Medical\scripts\deleteVictim.sqf";
      };
      class spawnVictim {
        file = "\SOG_Client\SOG_Funtions_F\Medical\scripts\spawnVictim.sqf";
      };
    };

    class Service {
      class serviceVehicle {
        file = "\SOG_Client\SOG_Funtions_F\Service\scripts\serviceVehicle.sqf";
      };
    };

    class Weather {
      class checkRain {
        file = "\SOG_Client\SOG_Funtions_F\Weather\scripts\checkRain.sqf";
      };
    };
  };
};