<script setup lang="ts">
definePageMeta ({
	layout: false
});

const slug = useRoute().params.slug.toString().replace(/,/g, "/");
const { data: blog } = await useAsyncData(slug, () => {
	return queryContent(slug).findOne();
});

useHead ({
	title: `${blog.value.title}`
});
</script>

<template>
	<NuxtLayout name="blog-post">
		<template #content>
			<article class="card">
				<ClientOnly>
					<img :src="blog.image" alt="Blog Image">
					<ContentRenderer class="card-body prose prose-gray prose-sm lg:prose-base prose-img:w-full prose-video:w-full" :value="blog">
						<template #empty>
							<p>No content found.</p>
						</template>
					</ContentRenderer>
				</ClientOnly>
			</article>
		</template>
		<template #author>
			<aside class="module">
				<img class="author-avatar" src="https://via.placeholder.com/1920x1080" alt="Author">
				<div class="module-body">
					<p class="author-about">Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat molestiae in qui doloremque quidem ea.</p>
					<h2 class="author-name">{{ blog.author }}</h2>
				</div>
			</aside>
		</template>
	</NuxtLayout>
</template>
