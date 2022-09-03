<template>
	<main class="container mx-auto px-4 pt-8 lg:pt-12">
		<div class="grid grid-cols-4 gap-4 grid-flow-row-dense">
			<Header title="Check Out Our Latest Blog Posts" subtitle="Learn. Share. Grow." meta="Blog Posts" />
			<section class="col-span-4 pt-12">
				<article class="blog">
					<slot name="feed"></slot>
				</article>
			</section>
		</div>
	</main>
</template>
