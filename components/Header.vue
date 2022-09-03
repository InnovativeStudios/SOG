<script setup lang="ts">
defineProps<{
	title?: string
	subtitle?: string
	meta?: string
}>()
</script>

<template>
	<header class="hero">
		<div class="hero-body">
			<h1 class="hero-title">{{ title }}</h1>
			<p class="hero-subtitle">{{ subtitle }}</p>
			<p class="hero-meta">{{ meta }}</p>
		</div>
	</header>
</template>
