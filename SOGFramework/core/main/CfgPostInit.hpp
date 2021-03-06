#include "script_component.hpp"

class GVARMAIN(Main) {  // Main first
    init = PATH_POST(main);
    clientInit = PATH_POST_CLIENT(main);
    serverInit = PATH_POST_SERVER(main);
};

class GVARMAIN(ACRE) {
    init = PATH_POST(acre);
    clientInit = PATH_POST_CLIENT(acre);
    serverInit = PATH_POST_SERVER(acre);
};

class GVARMAIN(Briefing) {
    init = PATH_POST(briefing);
    clientInit = PATH_POST_CLIENT(briefing);
    serverInit = PATH_POST_SERVER(briefing);
};

class GVARMAIN(Common) {
    init = PATH_POST(common);
    clientInit = PATH_POST_CLIENT(common);
    serverInit = PATH_POST_SERVER(common);
};

class GVARMAIN(Hostage) {
    init = PATH_POST(hostage);
    clientInit = PATH_POST_CLIENT(hostage);
    serverInit = PATH_POST_SERVER(hostage);
};

class GVARMAIN(IED) {
    init = PATH_POST(ied);
    clientInit = PATH_POST_CLIENT(ied);
    serverInit = PATH_POST_SERVER(ied);
};

class GVARMAIN(Intel) {
    init = PATH_POST(intel);
    clientInit = PATH_POST_CLIENT(intel);
    serverInit = PATH_POST_SERVER(intel);
};

class GVARMAIN(IntroText) {
    init = PATH_POST(intro_text);
    clientInit = PATH_POST_CLIENT(intro_text);
    serverInit = PATH_POST_SERVER(intro_text);
};

class GVARMAIN(TFAR) {
    init = PATH_POST(tfar);
    clientInit = PATH_POST_CLIENT(tfar);
    serverInit = PATH_POST_SERVER(tfar);
};
