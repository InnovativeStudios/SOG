<template>
	<main class="container mx-auto px-4 pt-20">
		<div class="grid grid-flow-row grid-rows-2">
			<Header title="Check Out Our Latest Blog Posts" subtitle="Learn. Share. Grow." meta="Blog Posts" />
			<section class="blog">
				<slot name="feed"></slot>
			</section>
		</div>
	</main>
</template>
