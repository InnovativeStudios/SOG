#include "script_component.hpp"

class CfgSounds {
    sounds[] = {};

    class GVARMAIN(TimerBeep) {
        name = "timer_beep";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_beep.wav", 1, 1, 5 };
        titles[] = {};
    };

    class GVARMAIN(TimerBeepShort) {
        name = "timer_beep_short";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_beep_short.wav", 1, 1, 5 };
        titles[] = {};
    };

    class GVARMAIN(TimerEnd) {
        name = "timer_end";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_end.wav", 1, 1, 5 };
        titles[] = {};
    };

    class GVARMAIN(TimerDefused) {
        name = "timer_defused";
        sound[] = { "\SOGFramework\core\ied\sounds\timer_diffused.wav", 1, 1, 5 };
        titles[] = {};
    };
};
