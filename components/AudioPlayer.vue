<template>
	<div>
		<audio :src="song.audio" preload="auto" ref="audioPlayer"></audio>
		<article class="grid grid-cols-6 gap-0 rounded-l-full bg-black opacity-75">
			<div class="relative col-span-1 flex justify-center rounded-l-full">
				<img class="rounded-full max-h-[4em] max-w-[4em]" :src="song.image" alt="...">
				<div class="absolute flex justify-center items-center w-full h-full">
					<!-- <button class="toggle-btn" @click="togglePrevious"><i class="fa-solid fa-backward-step fa-2xl"></i></button> -->
					<button class="toggle-btn" @click="togglePlay"><i class="fa-solid fa-2xl" :class="{'fa-play': !isPlaying, 'fa-pause': isPlaying}"></i></button>
					<!-- <button class="toggle-btn" @click="toggleNext"><i class="fa-solid fa-forward-step fa-2xl"></i></button> -->
				</div>
			</div>
			<div class="col-span-5 p-3">
				<p class="text-sky-400">{{ song.name }}</p>
				<p class="text-gray-400 text-xs"><span class="text-gray-200">{{ song.artistName }}</span> - {{ song.albumName }} ({{ song.year }})</p>
			</div>
		</article>
		<!-- <section class="flex flex-row justify-end items-center text-white">
			<button class="toggle-btn" @click="setIsVisible(false)">Back</button>
		</section> -->
	</div>
</template>

<script setup lang="ts">
const audioPlayer = ref(null)
const emit = defineEmits<{
  (e: 'goBack', value: boolean): void
  (e: 'next'): void
  (e: 'previous'): void
}>()

let isPlaying = ref(false)

defineProps<{
	isVisible: boolean,
	song: {
		id: number,
		name: string,
		artistName: string,
		albumName: string,
		year: number,
		image: string,
		audio: string
	}
}>()

function setIsVisible(value: boolean) {
  emit('goBack', value)
}

function toggleNext() {
  emit('next')
}

function togglePrevious() {
  emit('previous')
}

function togglePlay() {
	if (isPlaying.value) {
		audioPlayer.value.pause()
	} else {
		audioPlayer.value.play()
	}
	isPlaying.value = !isPlaying.value
	audioPlayer.value.volume = 0.05
}
</script>
