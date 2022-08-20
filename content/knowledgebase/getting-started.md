---
title: 'Knowledge Base - Getting Started'
---

# Getting Started

## Introduction
In this short guide you'll learn how to setup the framework and initialize the basic functions.

> **Note:** It is advised that you use a more advanced text/code editor to edit the files. Some recommendations [Notepad++](https://notepad-plus-plus.org/downloads/), [Atom](https://atom.io/) or [Visual Studio Code](https://code.visualstudio.com/download). SQF Syntax Packages are available to these editors which can help you a lot.

> **Note:** 3DEN Enhanced is an awsome tool that is recommended for mission editing. You can find it on the [Steam Workshop](https://steamcommunity.com/workshop/filedetails/?id=623475643)

## 1. Setting Up the Mission Folder
First of all, you need to setup a mission folder where you store your mission file along with its scripts and other assets. Open the 3DEN Editor in ArmA and Select the map you want to use for the mission. Press CTRL+S to save the empty mission which will create the mission folder for you in the following folder: `\Users\YOUR_USERNAME\Documents\Arma 3\mpmissions\` or `\Users\YOUR_USERNAME\Documents\Arma 3 - Other Profiles\YOUR_PROFILE\mpmissions\`.

> **Note:** It is advised that you use some sort of naming convention to keep your missions organised. Here's on for example: `CO16_Operation_Name.Altis`, where `CO` stands for Cooperative Mission, `16` is the available player slots, and `Operation_Name` is the name of the mission. **Don't Use Spaces in the Mission File, Use Underscores Instead.**

Once the folder is created, head over to the GitHub Repository and Download the Latest Release of the Framework from [here](https://github.com/InnovativeStudios/SOG/releases). Unzip the file and put it in the mission folder, so you should have something like this:

![Screenshot](https://camo.githubusercontent.com/1c6b92486b6fd263e5cb2b5f2ab19ffef4f5df95894988ba1f08d161efa3708e/68747470733a2f2f692e696d6775722e636f6d2f763362393878632e706e67)

**Folder Structure**
You don't really need to change things in the root of the mission file, except for the CBA settings but we'll cover that later. Here's a graph of the `SOG_Framework` folder to understand the structure better:

```
SOG_Framework
   ├───config                - Contains the mission configs
   │   ├───briefing          - Contains the briefing for each side
   │   ├───debriefing        - Contains the possible endings of the mission
   │   ├───gear              - Contains the gear of each side
   │   ├───img               - Contains any image added to the mission (contains the loading screen by default)
   │   ├───intel             - Contains the intel configs
   │   ├───config.sqf        - Configuration file of the framework and its modules
   │   └───description.hpp   - Arma mission config file
   │
   ├───core                  - Contains the modules
   │   └─── ...
```

Everything you need to change is in the config folder.
If you need more information about a module and its usage, then you'll find information in the README located in each module in core.

## 2. Configuring the Essential Modules
Now that the mission folder is setup, it's time to configure the basic settings in the config folder.

### Description
This file contains some of the more commonly used attributes of `description.ext` which can be located in the mission root.

First of all, you need to put down your [Steam ID](https://steamid.xyz/) where it's defined. The reason why it's required is because how the admin module is setup. The framework will recognize you as the creator of the mission based on the Steam UID and you'll have access to the admin functions during the mission, in case some debugging is needed. The logged-in admin on the server will also have access to these tools.

The rest of the attributes should be covered [here](https://community.bistudio.com/wiki/Description.ext) in details.

### Config
This contains the configuration of the framework, it has two parts: the first one is the essential mission parameters that need to be configured in every mission, the second half is the optional modules that you can enable/disable according to your needs.

The optional modules and their configuration are covered in the README file of each module located in the `SOG_Framework\core\` folder, so let's take a look at the Mission Parameters section now.

* Debug Mode: Enabled by default, while it's enabled it'll show `DEBUG` missages in the in-game chat which can help with the development of the mission. Don't forget to disable this before deploying the mission. `INFO`, `WARNING` and `ERROR` messages will show even if this setting is disabled.

* End Conditions: There are multiple End Conditions that you can use in your mission which are covered [here](https://github.com/InnovativeStudios/SOG/blob/main/SOGFramework/core/end_conditions/README.md).

### CfgDebriefing
This file is located in `SOG_Framework\debriefing\` folder and it holds all the possible mission endings for the mission. There are two sections by default:
| Section | Description |
| ------- | ----------- |
| COOP Endings | Mission Endings in Cooperative Mission Type |
| Game Master Ending | Ending for When the Admin Ends the Mission Manually |

As your next step you should customize the endings that you wish to use in the mission. The default endings are linked to the endings defined in `config.cfg`.

> **Note:** Do Not Remove any of the Default Endings as it can break parts of the framework.

Example Config and how it shows up in the game:

```
class MissionSuccess {
    title = "Mission Success";              // Closing Shot - Main title
    subtitle = "default_subtitle";          // Closing Shot - Short description
    description = "default_description";    // Debriefing - Summary of the mission
    pictureBackground = "";                 // Debriefing - 2:1 picture as background
    picture = "mil_end";                    // Closing Shot - 1:1 icon in the middle of the screen
    pictureColor[] = {0, 0.8, 0, 1};        // Closing Shot - Icon Colour
};
```
![Screenshot](https://camo.githubusercontent.com/e77ce7b6e0d7ec36797f599f5cace18c6c778fb6bbc9effa5e75a34dcb972cc5/68747470733a2f2f692e696d6775722e636f6d2f323969526b545a2e6a7067)

## 3. Setting the Editor Attributes
Most of the settings are already set in the framework, however there are some options that can't be set outside of the editor. You'll have to set these in the editor, and they can be found under the **Attributes** Tab in 3DEN.

### General
First thing you need to check in this section is the 'Independends Allegiance' option. If the mission features the **GREENFOR** side, then set the relation accordingly.

> **Note:** If the players are on the **GREENFOR** side in a Coop mission, then you have to use the **REDFOR** settings in the framework (Briefing Module, Gear Script, Etc.).

Secondly, make sure the 'Binarize the Scenario File' box is NOT Selected.
You don't have to change anything else.

### Environment
You can set the date, weather, and the forecase for the mission.

### Multiplayer
You have to change two things here:

First is the **Summary** of the mission. This should be the same as the `overviewText` in `SOG_Framework\config\description.hpp`. This way the description in the mission selection screen will match with the one on the player slot screen.

The second thing you have to change is the **Respawn** settings. Change it from 'Disabled' to 'Respawn on Custom Position'.
> **Note:** You have to change this even if the mission has no respawns.

> **Note:** For mor information about how to setup the respawn position, check out the tooltip in-game.

Don't change anything else.
![Screenshot](https://camo.githubusercontent.com/41cecc75b41fc21f3163fba27ada7d713fa036cade1e78ccf4a709f46d4ba482/68747470733a2f2f692e696d6775722e636f6d2f347463355541312e6a7067)

### Performance
I highly recommend using Dynamic Simulation in your mission. It allows you to disable the simulation of the AI that are outside of the player's(s') view distance massively improving performance.

For more information [Check Out this Link](https://community.bistudio.com/wiki/Arma_3_Dynamic_Simulation)

The garbage collector is configured by the framework so no need to set it here.

## 4. Setting Up Player Slots
Now that the basics are configured the next step is to add the player units and configure them. It is recommended that you use vanilla units (NATO, CSAT, Etc.) for the player slots because some modded units might not be configured properly.

Remember that the order in which you place down the units is going to be the order in the player slot screen. However, if you are using 3DEN Enhanced Mod, it can rearrange the order.

### Group
Once you are done with the unit layout, it is time to configure the slots. First of all, set the group name by clicking the group icon (Blue Rectangle or Red Square above the Squad Leader).
![Screenshot](https://camo.githubusercontent.com/04088e3d13e94518324dfe76242c2dbba1371fc6b63edf2def9e83e5eed7813b/68747470733a2f2f692e696d6775722e636f6d2f775a365a4a72592e6a7067)

### Unit
After that's done, you need to configure the individual player slots like shown below.
![Screenshot](https://camo.githubusercontent.com/6ca790e27575213650c57ba8c75b4f0af4566631a918aefe0f31524367fe98f8/68747470733a2f2f692e696d6775722e636f6d2f4c525054696d352e6a7067)

1. **Playable:** This checkbox controls if the unit is a player unit.
2. **Role Description:** The name of the unit's role on the player slot screen. Use the following format if the unit is the leader of the group: `ROLE_NAME@GROUP_NAME`, for example `Squad Leader@ALPHA`. No need to set the **GROUP_NAME** for each unit in the group, only for the group leader. This way the group name shows up properly in the player slot screen [example](https://i.imgur.com/okumQJW.jpg)
4. **Rank:** Optionally you can set the rank of the unit.

This is the basic setup of a unit, no need to set anything else.
**At this point the basics are configured and you can start working on the mission itself. Remember, if you need more information about the modules, then check out the `README` in the module folder. You can find the modules [here](https://github.com/InnovativeStudios/SOG/tree/development/SOG_Framework/core).

## 5. Notes
* **CBA Settings:** The framework comes with a default CBA Settings file that you can find in the root of the mission folder. However, it covers only a couple of basic mods (e.g. ACE, TFAR, Etc.), so you need to include any additional mods here.

[Latest Release](https://github.com/InnovativeStudios/SOG/releases/latest)