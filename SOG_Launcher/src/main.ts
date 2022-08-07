import {app, BrowserWindow, Menu} from 'electron';
import * as path from 'path';

function createWindow() {
	const mainWindow = new BrowserWindow({
		height: 600,
		width: 800,
		webPreferences: {
			preload: path.join(__dirname, 'preload.js')
		}
	});

	mainWindow.loadFile(path.join(__dirname, '../index.html'));
};

function createSettingsWindow() {
	const settingsWindow = new BrowserWindow({
		height: 600,
		width: 800,
		webPreferences: {
			preload: path.join(__dirname, 'preload.js')
		}
	});

	settingsWindow.loadFile(path.join(__dirname, '../settings.html'));
};

app.on('ready', () => {
	createWindow();

	app.on('activate', function() {
		if (BrowserWindow.getAllWindows().length === 0) createWindow();
	});

	// const mainMenu = Menu.buildFromTemplate(mainWindowMenu);
	// Menu.setApplicationMenu(mainMenu);
});

app.on('window-all-closed', function() {
	if (process.platform !== 'darwin') app.quit();
});

// const mainWindowMenu = [
// 	{
// 		label: 'File',
// 		submenu: [
// 			{
// 				label: 'Settings',
// 				click() {
// 					createSettingsWindow();
// 				}
// 			},
// 			{
// 				label: 'Quit',
// 				accelerator: process.platform === 'darwin' ? 'Command+Q' : 'Ctrl+Q',
// 				click() {
// 					app.quit();
// 				}
// 			}
// 		]
// 	}
// ];
