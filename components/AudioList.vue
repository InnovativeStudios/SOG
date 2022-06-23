<template>
	<div>
		<section class="bg-black opacity-90" v-if="!isVisible">
			<template v-for="(song, songIndex) in list" :key="song.id">
				<div class="grid grid-flow-row grid-cols-6">
					<div class="col-span-1">
						<img class="flex flex-row justify-center items-center w-full max-h-[4em]" :src="song.image" alt="...">
					</div>
					<div class="col-span-5 p-3">
						<button class="text-sky-400 hover:text-sky-600" @click="playSong(songIndex)">{{ song.name }}</button>
						<p class="text-gray-400 text-xs"><span class="text-gray-200">{{ song.artistName }}</span> - {{ song.albumName }} ({{ song.year }})</p>
					</div>
				</div>
			</template>
		</section>
		<section v-if="isVisible">
			<audio-player :song="list[currentSongIndex]" :is-visible="isVisible" @goBack="(value) => isVisible = value" @next="playNext" @previous="playPrevious" />
		</section>
	</div>
</template>

<script setup lang="ts">
const isVisible = ref(true)
const currentSongIndex = ref(0)
const list = [
	{
		id: 1,
		name: 'Guise',
		artistName: 'Avery Alexander',
		albumName: 'Stealth Music',
		year: 2022,
		image: '/images/logo.png',
		audio: '/music/stealth.mp3'
	},
	// {
	// 	id: 2,
	// 	name: 'Example',
	// 	artistName: 'Example Artist',
	// 	albumName: 'Example Album',
	// 	year: 2022,
	// 	image: '/images/logo.png',
	// 	audio: ''
	// }
]

function playSong(index: number) {
	currentSongIndex.value = index
	isVisible.value = true
}

function playNext() {
	if (currentSongIndex.value < list.length -1) {
		currentSongIndex.value++
	} else {
		currentSongIndex.value = 0
	}
}

function playPrevious() {
	if (currentSongIndex.value != 0) {
		currentSongIndex.value--
	} else {
		currentSongIndex.value = list.length -1
	}
}
</script>
