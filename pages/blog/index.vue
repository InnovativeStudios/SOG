<script setup lang="ts">
import { convertDate } from '@/utils/index'

useHead ({
	title: 'Blog Index'
});

const { query } = useRoute()
const { author } = query
const blogPostList = await queryContent("article").where({ author }).sort({ _file: -1, $numeric: true }).find()
</script>

<template>
	<NuxtLayout name="blog">
		<template #feed>
			<div class="card" v-for="blogPost in blogPostList" :key="blogPost._path">
				<img :src="blogPost.image" alt="Blog Post Image">
				<div class="card-body">
					<time datetime="2020-03-16">{{ convertDate(blogPost.date) }}</time>
					<br>
					<NuxtLink class="card-title" :to="`/blog${blogPost._path}`">{{ blogPost.title }}</NuxtLink>
					<p>{{ blogPost.description }}</p>
				</div>
				<div class="card-footer">
					<p>Post by <a class="nav-link" :href="`?author=${blogPost.author}`">{{ blogPost.author }}</a></p>
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
