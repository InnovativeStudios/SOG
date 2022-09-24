<script setup lang="ts">
definePageMeta ({
	layout: false
});

const slug = useRoute().params.slug.toString().replace(/,/g, "/");
const { data: knowledgebase } = await useAsyncData(slug, () => {
	return queryContent(slug).findOne();
});
const toc = computed(() => {
	if (!knowledgebase.value) return [];
	const items = knowledgebase.value.excerpt?.children;
	if (!items) return [];
	const toc = [];
	const tags = ["h2", "h3", "h4", "h5", "h6"];
	items.forEach((item) => {
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
		title: 'Home',
		link: '/knowledgebase',
		target: ''
	},
	{
		title: 'Framework',
		link: '/knowledgebase/framework',
		target: ''
	},
	{
		title: 'Loadouts',
		link: '/knowledgebase/loadout',
		target: ''
	},
	{
		title: 'Project Board',
		link: 'https://github.com/users/InnovativeStudios/projects/3/views/1',
		target: '_blank'
	}
]
useHead ({
	title: `${knowledgebase.value.title}`
});
</script>
	
<template>
	<div>
		<NuxtLayout name="wiki">
			<template #toc>
				<aside class="toc" v-if="knowledgebase.excerpt">
					<div class="toc-body">
						<h2 class="toc-title">Table Of Contents</h2>
						<ul class="nav">
							<li class="nav-item" v-for="(t, k) in toc" :key="`toc-item-${k}`">
								<NuxtLink class="nav-link" :class="{'text-md ml-2': t.depth == 2, 'text-sm ml-4': t.depth > 2}" :to="`#${t.id}`">{{ t.title }}</NuxtLink>
							</li>
						</ul>
						<h2 class="toc-title mt-3">Navigation</h2>
						<ul class="nav">
							<li class="nav-item" v-for="(n, i) in wikiNav" :key="`knowledgebase-nav-item-${i}`">
								<NuxtLink class="nav-link ml-2" :to="`${n.link}`" :target="`${n.target}`">{{ n.title }}</NuxtLink>
							</li>
						</ul>
					</div>
				</aside>
			</template>
			<template #content>
				<article class="card bg-white">
					<ClientOnly>
						<ContentRenderer class="card-body prose prose-zinc" :value="knowledgebase">
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