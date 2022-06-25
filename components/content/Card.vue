<template>
	<section class="border-r border-b shadow-sm bg-gray-800 p-3">
		<article class="grid grid-flow-row grid-cols-1 lg:grid-cols-3 lg:gap-3 items-center w-full h-full">
			<component is="icon" class="col-span-1 text-center text-white" :class="icon" />
			<div class="col-span-1 lg:col-span-2">
				<p class="text-center text-white text-sm lg:text-start">
					<NuxtLink class="text-2xl font-semibold !pl-0" :to="link">{{ title }}</NuxtLink>
					<br>
					{{ description }}
				</p>
			</div>
		</article>
	</section>
</template>

<script setup lang="ts">
defineProps<{
	title?: string,
	description?: string,
	icon?: string,
	link?: string
}>();
</script>