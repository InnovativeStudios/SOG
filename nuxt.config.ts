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
  css: ['@/assets/css/tailwind.css', '@/assets/fontawesome/css/all.min.css'],
  head: {
    script: ['@/assets/js/all.min.js']
  },
  modules: ['@nuxt/content'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {}
    }
  }
})