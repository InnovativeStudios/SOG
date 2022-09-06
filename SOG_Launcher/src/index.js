const btnCtl = document.getElementById("btnCtl")
const btnSelGameDir = document.getElementById('btnSelGameDir')
const gamePathElement = document.getElementById('gamePath')
const info = document.getElementById('info')
const player = document.getElementById("audioPlayer")

let isPlaying = false

player.volume = 0.05;

btnSelGameDir.addEventListener('click', async () => {
	const gamePath = await window.sogAPI.openFile()
	gamePathElement.innerText = gamePath
})

info.innerText = `Electron (v${sogAPI.electron()}) NodeJS (v${sogAPI.node()}) Chrome (v${sogAPI.chrome()})`

function goToSettingsWindow() {
	window.sogAPI.openSettingsWindow()
}

function onClick() {
	var exePath = gamePathElement.innerText
	// var modList = [`-mod="!Workshop/@ace;!Workshop/@ALiVE;!Workshop/@CBA_A3;@SOG"`]
	var modList = [`-mod=""`]
	var optionList = [`-noSplash -world="empty"`]
	window.sogAPI.openGame(exePath, modList, optionList)
}

function togglePlay() {
	if (!isPlaying) {
		isPlaying = true
		player.play()
		player.volume = 0.05
		btnCtl.innerHTML = `<i class="fas fa-volume"></i>`
	} else {
		isPlaying = false;
		player.pause();
		btnCtl.innerHTML = `<i class="fas fa-volume-mute"></i>`
	}
}

function update() {
	var appPath = 'external'
	window.sogAPI.updateMod(appPath)
}