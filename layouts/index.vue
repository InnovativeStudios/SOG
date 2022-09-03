<template>
	<div class="bg-black">
			<main class="container max-w-7xl mx-auto px-3">
				<section>
					<slot name="feat"></slot>
				</section>
			</main>
			<footer class="footer">
				<slot name="footer"></slot>
			</footer>
	</div>
</template>

<style scoped>
section {
	@apply relative w-full h-screen bg-[url('~/assets/images/background.jpg')] bg-no-repeat bg-center shadow-[inset_0_0_8em_8em_rgba(0,0,0,1)];
}
section:before {
	@apply content-[''] absolute top-0 left-0 w-full h-full opacity-50;
	background: inherit;
	box-shadow: inherit;
}
section:hover:before {
	@apply mix-blend-hard-light;
	animation: glitch .625s linear infinite;
	box-shadow: inherit;
}

@keyframes glitch {
	0% {
		background-position: 0 0;
		filter: hue-rotate(0deg);
	}
	10% {
		background-position: 0.3125em 0;
	}
	20% {
		background-position: -0.3125em 0;
	}
	30% {
		background-position: 0.9375em 0;
	}
	40% {
		background-position: 0.3125em 0;
	}
	50% {
		background-position: -1.5625em 0;
	}
	60% {
		background-position: -3.125em 0;
	}
	70% {
			background-position: 0 -1.25em;
	}
	80% {
		background-position: -3.75em -1.25em;
	}
	81% {
		background-position: 0 0;
	}
	100% {
		background-position: 0 0;
		filter: hue-rotate(360deg);
	}
}
</style>
