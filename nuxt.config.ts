import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
  content: {
    markdown: {
      toc: {
        depth: 3,
        searchDepth: 3
      }
    },
    highlight: { theme: 'dracula-soft' }
  },
  css: ['@/assets/css/tailwind.css','@/assets/fontawesome/css/all.css'],
  modules: ['@nuxt/content'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {}
    }
  }
})
