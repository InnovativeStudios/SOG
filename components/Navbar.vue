<template>
	<div class="bg-black">
		<header class="container mx-auto">
			<nav class="flex justify-center sm:justify-end items-center h-20 px-4">
					<ul class="flex items-center space-x-4">
						<li v-for="(n, i) in links" :key="`navLink-${i}`">
							<NuxtLink class="nav-link text-white" :to="n.link">{{ n.name }}</NuxtLink>
						</li>
						<li>
							<a href="https://github.com/users/InnovativeStudios/projects/3/views/1" class="nav-link">Project Board</a>
						</li>
					</ul>
			</nav>
		</header>
	</div>
</template>

<script setup lang="ts">
const links = [
	{
		name: 'Home',
		link: '/'
	},
	{
		name: 'Blog',
		link: '/blog'
	},
	{
		name: 'Wiki',
		link: '/wiki'
	}
]
</script>

<style scoped>
.nav-link.router-link-active.router-link-exact-active {
	@apply text-white;
	text-shadow: 0 0 0.25em theme('colors.sky.400'), 0 0 0.25em theme('colors.black');
}
.nav-link {
	@apply uppercase font-semibold text-lg text-gray-100;
}
.nav-link:hover {
	@apply text-white;
	text-shadow: 0 0 0.25em theme('colors.sky.400'), 0 0 0.25em theme('colors.black');
}
</style>
