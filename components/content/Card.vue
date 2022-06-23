<template>
	<article class="border-r border-b shadow-sm bg-gray-800 p-3">
		<div class="grid grid-flow-row grid-cols-1 lg:grid-cols-3 lg:gap-3 items-center w-full h-full">
			<aside class="col-span-1 text-center text-white">
				<component is="icon" :class="icon" />
			</aside>
			<section class="col-span-1 lg:col-span-2">
				<p class="flex flex-col text-center text-white lg:text-start">
					<NuxtLink class="text-2xl font-semibold" :to="link" style="padding-left: 0px !important">{{ title }}</NuxtLink>
					{{ description }}
				</p>
			</section>
		</div>
	</article>
</template>

<script setup lang="ts">
defineProps<{
	title?: string,
	description?: string,
	icon?: string,
	link?: string
}>();
</script>