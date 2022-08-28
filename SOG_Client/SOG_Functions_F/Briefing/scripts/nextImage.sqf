/*
* Author: PDT for J. Schmidt
* displays the next image
*
* Arguments:
* 0: _controller <OBJECT> - object that controls the slide show
*
* Return Value:
* <BOOL> - true if the next image was displayed; false if not
*
*/

params [["_controller", objNull]];

if (isNull _controller) exitWith {
	_return = false;
	_return
};

// array of controllers
private _controllers = _controller getVariable ["SOG_SlideShow_Controllers", []];

// the current image
private _currentIndex = _controller getVariable ["SOG_SlideShow_CurrentIndex", 0];

// the images to display
private _images = _controller getVariable ["SOG_SlideShow_Images", []];

// the screens to display images on
private _screens = _controller getVariable ["SOG_SlideShow_Screens", []];


if (_images isEqualTo []) exitWith {            // makes sure there are images
	_return = false;
	_return
};

if (_screens isEqualTo []) exitWith {           // make sure there are screens
	_return = false;
	_return
};

if (_controllers isEqualTo []) exitWith {           // make sure there are controllers
	_return = false;
	_return
};

private _imageCount = (count _images) - 1;      	// number of images
if (_currentIndex isEqualTo _imageCount) then { 	// if we're at the last image
	_currentIndex = 0;                            	// reset the index
} else {                                        	// otherwise
	_currentIndex = _currentIndex + 1;            	// increment the index
};

{ // set the image on each screen
	_x setObjectTextureGlobal [0, (_images select _currentIndex) select 0];
} forEach _screens;

// set our current image so our other functions work correctly
{
	_x setVariable ["SOG_SlideShow_CurrentIndex", _currentIndex];
} forEach _controllers;

_return = true;
_return