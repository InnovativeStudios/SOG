<template>
	<div class="bg-gray-100 min-h-screen">
		<main class="container mx-auto px-4 pt-8 lg:pt-12">
			<div class="grid grid-flow-row grid-rows-2">
				<Header title="Check Out Our Latest Blog Posts" subtitle="Learn. Share. Grow." meta="Blog Posts" />
				<section class="blog">
					<slot name="feed"></slot>
				</section>
			</div>
		</main>
	</div>
</template>
