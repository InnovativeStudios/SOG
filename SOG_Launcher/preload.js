const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('sogAPI', {
  node: () => process.versions.node,
  chrome: () => process.versions.chrome,
  electron: () => process.versions.electron,

  openFile: () => ipcRenderer.invoke('dialog:openFile'),
  openFolder: () => ipcRenderer.invoke('dialog:openFolder'),

  openGame: (exePath, modList, optionList) => {
    var child = require('child_process').execFile
    child(exePath, [modList, optionList], function(e, data) {
      if (e) {
        console.error(e)
        return
      }
      console.log(data.toString())
    })
  },

  openSettingsWindow: () => {
    ipcRenderer.send('openSettingsWindow')
  },

  updateMod: (appPath) => {
    var https = require('https')
    var fs = require('fs')

    var file = fs.createWriteStream(appPath + '/SOG.zip')
    var req = https.get('https://drive.google.com/uc?export=download&id=1TKdqYJytqjPwNmzCahUbccOCfxqjJgVq', (res) => {
      res.pipe(file)
      console.log('statusCode:', res.statusCode)
      console.log('headers:', res.headers)
    })
  }
})