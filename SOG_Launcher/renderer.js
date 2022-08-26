const btnSelDir = document.getElementById('btnSelDir')
const dirPathElement = document.getElementById('dirPath')
btnSelDir.addEventListener('click', async () => {
  const dirPath = await window.electronAPI.openFile()
  dirPathElement.innerText = dirPath
})

const information = document.getElementById('info')
information.innerText = `Electron (v${versions.electron()}) NodeJS (v${versions.node()}) Chrome (v${versions.chrome()})`

function onClick() {
  var exePath = dirPathElement.innerText
  var modList = [`-mod="!Workshop/@ace;!Workshop/@ALiVE;!Workshop/@CBA_A3;@sog"`]
  window.electron.openGame(exePath, modList)
}
