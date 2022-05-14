#include "script_component.hpp"

class GVARMAIN(Main) {  // Main first
    init = PATH_PRE(main);
};

class GVARMAIN(ACRE) {
    init = PATH_PRE(acre);
};

class GVARMAIN(Briefing) {
    init = PATH_PRE(briefing);
};

class GVARMAIN(Common) {
    init = PATH_PRE(common);
};

class GVARMAIN(Hostage) {
    init = PATH_PRE(hostage);
};

class GVARMAIN(IED) {
    init = PATH_PRE(ied);
};

class GVARMAIN(Intel) {
    init = PATH_PRE(intel);
};

class GVARMAIN(IntroText) {
    init = PATH_PRE(intro_text);
};

class GVARMAIN(TFAR) {
    init = PATH_PRE(tfar);
};
