<template>
	<div class="bg-gray-100 min-h-screen">
		<main class="container mx-auto px-4 pt-10 lg:pt-20">
			<section class="content">
				<div class="col-span-2">
					<slot name="toc"></slot>
				</div>
				<div class="col-span-6">
					<slot name="content"></slot>
					<slot name="empty"></slot>
				</div>
			</section>
		</main>
	</div>
</template>