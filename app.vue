<script setup>
useHead({
  titleTemplate: (titleChunk) => {
    return titleChunk ? `SOG | ${titleChunk}` : 'SOG';
  }
})
</script>

<template>
  <div>
    <Navbar />
    <NuxtPage />
  </div>
</template>
