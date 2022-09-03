<script setup lang="ts">
import { convertDate } from '@/utils/index'
useHead ({
	title: 'Blog Index'
});

const { data: blogPostList } = await useAsyncData("blogPostList", () => {
	return queryContent('/blog').find();
});
</script>

<template>
	<NuxtLayout name="blog">
		<template #feed>
			<div class="card" v-for="blogPost in blogPostList" :key="blogPost._path">
				<img :src="blogPost.image" alt="Blog Post Image">
				<div class="card-body">
					<p>{{ convertDate(blogPost.date) }}</p>
					<NuxtLink class="card-title" :to="`/blog${blogPost._path}`">{{ blogPost.title }}</NuxtLink>
					<p>{{ blogPost.description }}</p>
				</div>
				<div class="card-footer">
					<p>Post by <NuxtLink class="nav-link" to="#">{{ blogPost.author }}</NuxtLink></p>
					<div>
						<button class="btn" type="button">
							<i class="fab fa-facebook"></i>
						</button>
						<button class="btn mx-3" type="button">
							<i class="fab fa-twitter"></i>
						</button>
						<button class="btn" type="button">
							<i class="fab fa-google"></i>
						</button>
					</div>
				</div>
			</div>
		</template>
	</NuxtLayout>
</template>
