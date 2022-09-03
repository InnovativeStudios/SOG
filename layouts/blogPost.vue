<template>
	<main class="container mx-auto px-4 pt-8 lg:pt-12">
		<section class="content">
			<div class="col-span-6">
				<slot name="content"></slot>
				<slot name="empty"></slot>
			</div>
				<div class="col-span-2">
					<slot name="author"></slot>
				</div>
		</section>
	</main>
</template>
