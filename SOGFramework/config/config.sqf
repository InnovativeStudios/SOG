#include "..\core\main\script_macros.hpp"  // DO NOT REMOVE

/* -------------------------------- MISSION PARAMETERS -------------------------------- */

// Debug mode
GVARMAIN(debugMode) = true;  // Debug mode for mission/framework development (turn it off before deploying the mission)


// End condition - Player casualty limit
GVARMAIN(modulePlayerCasualties) = false;  // Coop
EGVAR(end_conditions,playerCasLimit) = 75;  // Coop: Percentage of the max. allowed player casualty

// End condition - Civilian casualty limit
GVARMAIN(moduleCivilianCasualties) = false;  // Coop
EGVAR(end_conditions,civilianCasLimit) = 50;  // Percentage of the max. allowed civilian casualty


// End condition - Task limit
GVARMAIN(moduleTaskLimit) = false;  // Coop
EGVAR(end_conditions,taskLimit) = 2;  // Minimum number of completed tasks


/* --------------------------------- OPTIONAL MODULES --------------------------------- */

// ACRE
GVARMAIN(moduleACRE) = false;  // Coop
EGVAR(acre,useBabel) = false;  // TvT


// Briefing
GVARMAIN(moduleBriefing) = false;  // Coop


// Custom channel
GVARMAIN(moduleCustomChannel) = false;  // Coop
EGVAR(custom_channel,channelName) = "JTAC channel";  // Name of the channel
EGVAR(custom_channel,channelColour) = [0.8, 0, 0.5, 1];  // Colour of the channel (RGBA format, default: FK pink)


// Destroy
GVARMAIN(moduleDestroy) = true;  // Coop


// Hostage
GVARMAIN(moduleHostage) = true;  // Coop


// HVT
GVARMAIN(moduleHVT) = true;  // Coop


// IED
GVARMAIN(moduleIED) = true;  // Coop


// Intel
GVARMAIN(moduleIntel) = false;  // Coop


// Intro text
GVARMAIN(moduleIntroText) = true;  // Coop
EGVAR(intro_text,title) = "TEST TITLE";  // Title
EGVAR(intro_text,date) = "TEST DATE";  // Date
EGVAR(intro_text,location) = "TEST LOCATION";  // Location
EGVAR(intro_text,delay) = 15;  // Delay after loading in


// TFAR
GVARMAIN(moduleTFAR) = false;  // Coop
