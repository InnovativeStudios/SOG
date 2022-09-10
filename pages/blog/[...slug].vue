<script setup lang="ts">
import { convertDate } from '@/utils/index';

definePageMeta ({
	layout: false
});

const slug = useRoute().params.slug.toString().replace(/,/g, "/");
const { data: article } = await useAsyncData(slug, () => {
	return queryContent(slug).findOne();
});

useHead ({
	title: `${article.value.title}`
});
</script>

<template>
	<NuxtLayout name="blog-post">
		<template #content>
			<article class="card">
				<ClientOnly>
					<img :src="article.image" alt="Article Image">
					<div class="card-body">
						<p>{{ convertDate(article.date) }}</p>
						<ContentRenderer class="" :value="article">
							<template #empty>
								<p>No content found.</p>
							</template>
						</ContentRenderer>
					</div>
				</ClientOnly>
			</article>
		</template>
		<template #author>
			<aside class="module">
				<img class="author-avatar" src="https://via.placeholder.com/1920x1080" alt="Author">
				<div class="module-body">
					<p class="author-about">Lorem ipsum dolor sit amet consectetur adipisicing elit. Repellat molestiae in qui doloremque quidem ea.</p>
					<h2 class="author-name">{{ article.author }}</h2>
				</div>
			</aside>
		</template>
	</NuxtLayout>
</template>
