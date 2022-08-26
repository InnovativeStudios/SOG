var player = document.getElementById("audioPlayer");
var btn = document.getElementById("ctlBtn");
let isPlaying = false;

player.volume = 0.05;

function togglePlay() {
	if (!isPlaying) {
		isPlaying = true;
		player.play();
		player.volume = 0.05;
		btn.innerHTML = `<i class="fas fa-volume-mute"></i>`
	} else {
		isPlaying = false;
		player.pause();
		btn.innerHTML = `<i class="fas fa-volume"></i>`
	}
}

function stop() {
	togglePlay();
	player.pause();
	player.currentTime = 0;
	btn.innerHTML = `<i class="fas fa-volume-mute"></i>`
}