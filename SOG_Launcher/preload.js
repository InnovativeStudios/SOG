const { contextBridge, ipcRenderer } = require('electron')

contextBridge.exposeInMainWorld('versions', {
  node: () => process.versions.node,
  chrome: () => process.versions.chrome,
  electron: () => process.versions.electron,
})

contextBridge.exposeInMainWorld('electronAPI', {
  openFile: () => ipcRenderer.invoke('dialog:openFile')
})

contextBridge.exposeInMainWorld('electron', {
  openGame: (exePath, modList) => {
    var child = require('child_process').execFile

    child(exePath, [modList], function(e, data) {
      if (e) {
        console.error(e)
        return
      }
      console.log(data.toString())
    })
  }
})