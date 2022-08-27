const { app, BrowserWindow, dialog, ipcMain } = require('electron')
const path = require('path')

async function handleFileOpen() {
  const { cancelled, filePaths } = await dialog.showOpenDialog()
  if (cancelled) {
    return
  } else {
    return filePaths[0]
  }
}

async function handleFolderOpen() {
  const { cancelled, filePaths } = await dialog.showOpenDialog({
    properties: ['openDirectory']
  })
  if (cancelled) {
    return
  } else {
    return filePaths[0]
  }
}

function createWindow() {
  mainWindow = new BrowserWindow({
    icon: path.join(__dirname, './src/images/icon.ico'),
    width: 1280,
    height: 720,
    webPreferences: {
      contextIsolation: true,
      nodeIntegration: true,
      preload: path.join(__dirname, 'preload.js')
    }
  })

  mainWindow.loadFile('./src/index.html')
  mainWindow.menuBarVisible = false
  mainWindow.resizable = false
  // mainWindow.webContents.openDevTools()
}

function createSettingsWindow() {
  settingsWindow = new BrowserWindow({
    icon: path.join(__dirname, './src/images/icon.ico'),
    width: 800,
    height: 600,
    modal: true,
    show: false,
    parent: mainWindow,

    webPreferences: {
      preload: path.join(__dirname, 'preload.js')
    }
  })

  settingsWindow.loadFile('./src/settings.html')
  settingsWindow.menuBarVisible = false
  settingsWindow.resizable = false
  settingsWindow.once('ready-to-show', (event, arg) => {
    settingsWindow.show()
  })
}

ipcMain.on('openSettingsWindow', (event, arg) => {
  createSettingsWindow()
})

app.whenReady().then(() => {
  ipcMain.handle('dialog:openFile', handleFileOpen)
  ipcMain.handle('dialog:openFolder', handleFolderOpen)
  createWindow()

  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow()
  })
})

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit()
})

app.getFileIcon('./src/images/icon.ico')

app.setAppUserModelId(process.execPath)

try {
  require('electron-reloader')(module)
} catch (_) {}