/*
* Author: PDT for J. Schmidt
* sets up a slide show
*
* Arguments:
* 0: _screen      <ARRAY>  - array of objects to display images on
* 1: _controllers <ARRAY>  - array of objects to use are controlers
* 2: _images      <ARRAY>  - array of image paths; images should be powers of 2
* 3: _autoScroll  <BOOL>   - should the image auto-scroll
* 4: _units        <ARRAY>  - unit(s) that should speak
* 5: _topic       <STRING> - conversation topic
* 6: _sentence    <STRING> - conversation sentence, "" = play all
*
* Return Value:
* <BOOL> - true if slide show was setup; false if not
*
* Example:
* [Screen01, [Controler01], ["images\folder\image.paa"]] call PDT_initSlideShow;
*
*/

params [["_screens", []], ["_controllers", []], ["_images", []], ["_autoScroll", false], ["_units", []], ["_topic", ""], ["_sentence", ""]];

// split the check up in case you need to output specific errors for each one
if (_screens isEqualTo []) exitWith {
	_return = false;
	_return;
};

if (_controllers isEqualTo []) exitWith {
	_return = false;
	_return;
};

if (_images isEqualTo []) exitWith {
	_return = false;
	_return;
};

{
	// set some variables
	_x setVariable ["SOG_SlideShow_Images", _images, true];
	_x setVariable ["SOG_SlideShow_Screens", _screens, true];
	_x setVariable ["SOG_SlideShow_CurrentIndex", 0, true];
	_x setVariable ["SOG_SlideShow_Controllers", _controllers, true];
	_x setVariable ["SOG_SlideShow_AutoScroll", _autoScroll, true];
	_x setVariable ["PDT_SlideShow_Units", _units, true];
	_x setVariable ["PDT_SlideShow_Topic", _topic, true];
	_x setVariable ["PDT_SlideShow_Sentence", _sentence, true];

	// Start slide show action
	_x addAction
	["Start slide show",{params ["_target", "_caller", "_actionId", "_arguments"];_target setVariable ["SOG_SlideShow_Started", true, true];[_target] call SOGStartSlideShow;},nil,1.5,true,true,"","!(_target getVariable [""SOG_SlideShow_Started"", false])",2.5,false,"",""];

	// Next image action
	_x addAction
	["Next image",{params ["_target", "_caller", "_actionId", "_arguments"];[_target] call SOGNextImage;},nil,1.5,true,true,"","_target getVariable [""SOG_SlideShow_Started"", false] && {!(_target getVariable [""SOG_SlideShow_AutoScroll"", false])}",2.5,false,"",""];

	// Previous image action
	_x addAction
	["Previous image",{params ["_target", "_caller", "_actionId", "_arguments"];[_target] call SOGPrevImage;},nil,1.5,true,true,"","_target getVariable [""SOG_SlideShow_Started"", false] && {!(_target getVariable [""SOG_SlideShow_AutoScroll"", false])}",2.5,false,"",""];

	// End slide show action
	_x addAction
	["End slide show",{params ["_target", "_caller", "_actionId", "_arguments"];[_target] call SOGEndSlideShow;},nil,1.5,true,true,"","_target getVariable [""SOG_SlideShow_Started"", false]",2.5,false,"",""];
} forEach _controllers;

_return = true;
_return