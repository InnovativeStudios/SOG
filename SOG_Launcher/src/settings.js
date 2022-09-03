const btnSelGameDir = document.getElementById('btnSelGameDir')
const btnSelModDir = document.getElementById('btnSelModDir')
const gamePathElement = document.getElementById('gamePath')
const modPathElement = document.getElementById('modPath')

btnSelGameDir.addEventListener('click', async () => {
	const gamePath = await window.sogAPI.openFile()
	gamePathElement.innerText = gamePath
})

btnSelModDir.addEventListener('click', async () => {
	const modPath = await window.sogAPI.openFolder()
	modPathElement.innerText = modPath
})