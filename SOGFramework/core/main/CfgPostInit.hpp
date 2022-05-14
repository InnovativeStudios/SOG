#include "script_component.hpp"

class GVARMAIN(Main) {  // Main first
    init = PATH_POST(main);
    clientInit = PATH_POST_CLIENT(main);
    serverInit = PATH_POST_SERVER(main);
};

class GVARMAIN(Hostage) {
    init = PATH_POST(hostage);
    clientInit = PATH_POST_CLIENT(hostage);
    serverInit = PATH_POST_SERVER(hostage);
};
