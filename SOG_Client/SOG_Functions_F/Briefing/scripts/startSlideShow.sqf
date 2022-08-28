/*
 * Author: PDT for J. Schmidt
 * starts the slideshow
 *
 * Arguments:
 * 0: _controller  <OBJECT> - object that controls the slide show
 *
 * Return Value:
 * <BOOL> - true if slide show was started
 *
 */

params [["_controller", objNull], ["_units", []], ["_topic", ""], ["_sentence", ""]];

if (isNull _controller) exitWith {
	_return = false;
	_return
};

// should it auto scroll
private _autoScroll = _controller getVariable ["SOG_SlideShow_AutoScroll", false];

// array of controllers
private _controllers = _controller getVariable ["SOG_SlideShow_Controllers", []];

// the current image
private _currentIndex = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];

// the images to display
private _images = _controller getVariable ["SOG_SlideShow_Images", []];

// the screens to display images on
private _screens = _controller getVariable ["SOG_SlideShow_Screens", []];

// array of units
private _units = _controller getVariable ["PDT_SlideShow_Units", []];

// the converstation topic
private _topic = _controller getVariable ["PDT_SlideShow_Topic", ""];

// the conversation sentence(s)
private _sentence = _controller getVariable ["PDT_SlideShow_Sentence", ""];


if (_images isEqualTo []) exitWith {            // makes sure there are images
	_return = false;
	_return
};

if (_screens isEqualTo []) exitWith {           // make sure there are screens
	_return = false;
	_return
};

if (_controllers isEqualTo []) exitWith {       // make sure we have controllers
	_return = false;
	_return
};

private _imageCount = (count _images) - 1;      		// number of images
	if (_currentIndex isEqualTo _imageCount) then { 	// just in-case somthing
	_currentIndex = 0;                            		// weird happens
};

[_topic, "MissionName", _sentence, false, nil, _units, 1, false] spawn BIS_fnc_kbTell;

// set the image on each screen
{
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
} forEach _screens;

// set our current image so our other functions work correctly
{
	_x setVariable ["SOG_SlideShow_CurrentIndex", _currentIndex];
} forEach _controllers;

if (_autoScroll) then {
	/*
	So this bit can get a bit complicated especially if your doing it with
	a lot of arrays.

	Basically what we're doing is saying "for every element in the _image array,
	get the index we're at, get the image we're on, and get the durration for
	the image.

	Once we have all that we are going to apply the image to
	every element in the _screens array and wait for that images durration.

	After we've set the image and waited then we're going to increment and
	save our index and do all that again untill someone ends the slide show."
	*/

	while {_controller getVariable ["SOG_SlideShow_Started", false]} do {
		{
			// current index - not technically need but just in case it is
			private _index = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];
			private _image = _x select 0; // current image
			private _sleep = _x select 1; // how long the image should last

			if (_controller getVariable ["SOG_SlideShow_Started", false]) exitWith {};

			{
				_x setObjectTextureGlobal [0, _image];
				uiSleep _sleep;
			} forEach _screens;

			_index = _index + 1;
			_controller setVariable ["SOG_SlideShow_CurrentIndex", _index]
		} forEach _images;
	};
};

_return = true;
_return