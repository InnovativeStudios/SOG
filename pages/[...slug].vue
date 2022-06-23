<template>
	<div>
		<NuxtLayout name="wiki">
			<template #toc>
				<aside class="toc" v-if="wiki.excerpt">
					<div class="toc-body">
						<h2 class="toc-title">Table Of Contents</h2>
						<ul class="nav">
							<li class="nav-item" v-for="(t, k) in toc" :key="`toc-item-${k}`">
								<NuxtLink class="nav-link" :class="{'text-md ml-2': t.depth == 2, 'text-sm ml-4': t.depth > 2}" :to="`#${t.id}`">{{ t.title }}</NuxtLink>
							</li>
						</ul>
							<h2 class="toc-title mt-3">Wiki Navigation</h2>
						<ul class="nav">
							<li class="nav-item" v-for="(n, i) in wikiNav" :key="`wiki-nav-item-${i}`">
								<NuxtLink class="nav-link ml-2" :to="`${n.link}`">{{ n.title }}</NuxtLink>
							</li>
						</ul>
					</div>
				</aside>
			</template>
			<template #content>
				<article class="card">
					<ClientOnly>
						<ContentRenderer class="card-body prose prose-gray prose-sm lg:prose-base" :value="wiki">
							<template #empty>
								<p>No content found.</p>
							</template>
						</ContentRenderer>
					</ClientOnly>
				</article>
			</template>
		</NuxtLayout>
	</div>
</template>

<script setup lang="ts">
definePageMeta ({
  layout: false
});

const slug = useRoute().params.slug.toString().replace(/,/g, "/");
const { data: wiki } = await useAsyncData(slug, () => {
	return queryContent(slug).findOne();
});
const toc = computed(() => {
	if (!wiki.value) return [];
	const items = wiki.value.excerpt?.children;
	if (!items) return [];
	const toc = [];
	const tags = ["h2", "h3", "h4", "h5", "h6"];
	items.forEach((item: any) => {
		if (tags.includes(item.tag)) {
			toc.push({
				id: item.props.id,
				title: item.props.id.toString().replace(/-/g, " "),
				depth: Number(item.tag.replace(/h/g, ""))
			});
		};
	});
	return toc;
});
const wikiNav = [
	{
		title: 'Wiki Home',
		link: '/wiki'
	},
	{
		title: 'Wiki Framework',
		link: '/wiki/framework'
	},
	{
		title: 'Wiki Loadouts',
		link: '/wiki/loadout'
	},
	{
		title: 'Project Board',
		link: 'https://github.com/users/InnovativeStudios/projects/3/views/1'
	}
]
useHead ({
	title: `${wiki.value.title}`
});
</script>