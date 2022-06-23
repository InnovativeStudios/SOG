<template>
	<div>
		<Navbar />
		<NuxtPage />
	</div>
</template>

<script setup>
useHead({
	titleTemplate: (titleChunk) => {
		return titleChunk ? `SOG | ${titleChunk}` : 'SOG';
	}
})
</script>
