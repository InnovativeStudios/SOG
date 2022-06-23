<template>
	<div>
		<NuxtLayout name="index">
			<template #feat>
				<article class="feat">
					<div class="feat-body">
						<h1 class="feat-title mb-3">Tom Clancy's SOG</h1>
						<audio-list />
					</div>
				</article>
			</template>
			<template #footer>
				<p>&copy; {{ year }} Innovative Studios.</p>
			</template>
		</NuxtLayout>
	</div>
</template>

<script setup lang="ts">
definePageMeta ({
  layout: false
});

useHead ({
	title: 'Home'
});

defineProps<{
	title?: string
}>();

let year = new Date().getFullYear();
</script>
