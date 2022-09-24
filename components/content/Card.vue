<script setup lang="ts">
defineProps<{
	title?: string,
	description?: string,
	icon?: string,
	link?: string
}>();
</script>

<template>
	<article class="card card-feat">
		<div class="card-body">
			<component is="icon" :class="icon" />
			<p class="card-text">
				<NuxtLink :to="link">{{ title }}</NuxtLink>
				{{ description }}
			</p>
		</div>
	</article>
</template>

<style scoped lang="scss">
.card {
	@apply border-r border-b shadow-sm bg-zinc-900 h-40 max-h-40 mb-0;
	&.card-feat {
		@apply flex items-stretch;
		.card-body {
			@apply flex flex-1 flex-col lg:flex-row items-center justify-center gap-2 p-2;
			icon {
				@apply flex flex-row lg:basis-1/4 justify-center text-white;
			}
			.card-text {
				@apply flex flex-col lg:basis-3/4 justify-end text-gray-400 text-center lg:text-start text-xs sm:text-sm md:text-base;
				a {
					@apply font-semibold text-sm sm:text-base md:text-xl lg:text-2xl pl-0;
				}
			}
		}
	}
}
</style>