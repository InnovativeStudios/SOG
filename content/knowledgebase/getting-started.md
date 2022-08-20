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

### `Description.hpp`
This file contains some of the more commonly used attributes of `description.ext` which can be located in the mission root.

First of all, you need to put down your [Steam ID](https://steamid.xyz/) where it's defined. The reason why it's required is because how the admin module is setup. The framework will recognize you as the creator of the mission based on the Steam UID and you'll have access to the admin functions during the mission, in case some debugging is needed. The logged-in admin on the server will also have access to these tools.

The rest of the attributes should be covered [here](https://community.bistudio.com/wiki/Description.ext) in details.

### `Config.sqf`
This contains the configuration of the framework, it has two parts: the first one is the essential mission parameters that need to be configured in every mission, the second half is the optional modules that you can enable/disable according to your needs.

The optional modules and their configuration are covered in the README file of each module located in the `SOG_Framework\core\` folder, so let's take a look at the Mission Parameters section now.

* Debug Mode: Enabled by default, while it's enabled it'll show `DEBUG` missages in the in-game chat which can help with the development of the mission. Don't forget to disable this before deploying the mission. `INFO`, `WARNING` and `ERROR` messages will show even if this setting is disabled.

* End Conditions: There are multiple End Conditions that you can use in your mission which are covered [here](https://github.com/InnovativeStudios/SOG/blob/main/SOG_Framework/core/end_conditions/README.md).

### `CfgDebriefing.hpp`
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