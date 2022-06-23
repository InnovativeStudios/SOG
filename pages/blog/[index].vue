<template>
	<div>
		<NuxtLayout name="news">
			<template #feed>
				<div class="card" v-for="(b, i) in blogNav[0].children" :key="`blogNavItem-${b._path}-${i}`">
					<h2 class="card-title">{{ b.title }}</h2>
					<ul class="nav" v-if="b.children">
						<template v-for="(child, k) in b.children" :key="`childNav-${child._path}-${k}-${i}`">
							<li class="nav-item">
								<NuxtLink class="nav-link" :to="`/blog${child._path}`">{{ child.title }}</NuxtLink>
							</li>
						</template>
					</ul>
					<ul class="nav" v-else>
						<li class="nav-item">
							<NuxtLink class="nav-link" :to="`/blog${b._path}`">Read More</NuxtLink>
						</li>
					</ul>
				</div>
			</template>
		</NuxtLayout>
	</div>
</template>

<script setup>
useHead ({
	title: 'Blog Index'
});

const { data: blogNav } = await useAsyncData("navigation", () => {
	return fetchContentNavigation(queryContent("article"));
});
</script>
