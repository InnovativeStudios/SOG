#include "script_component.hpp"

class CfgSounds {
    sounds[] = {};

    class GVARMAIN(TimerBeep) {
        name = "detector_beep";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_beep.wav", 1, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(TimerBeepShort) {
        name = "timer_beep_short";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_beep_short.wav", 1, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(TimerEnd) {
        name = "timer_end";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_end.wav", 1, 1, 5 };
        titles[] = { 1, "" };
    };

    class GVARMAIN(TimerDiffused) {
        name = "timer_diffused";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_diffused.wav", 1, 1, 5 };
        titles[] = { 1, "" };
    };
};
