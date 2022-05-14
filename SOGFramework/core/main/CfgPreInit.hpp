#include "script_component.hpp"

class GVARMAIN(Main) {  // Main first
    init = PATH_PRE(main);
};

class GVARMAIN(Hostage) {
    init = PATH_PRE(hostage);
};
