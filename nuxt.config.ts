import { defineNuxtConfig } from 'nuxt'

// https://v3.nuxtjs.org/api/configuration/nuxt.config
export default defineNuxtConfig({
    build: {
        postcss: {
            postcssOptions: {
                plugins: {
                    tailwindcss: {},
                    autoprefixer: {}
                }
            }
        }
    },
    content: {
        markdown: {
            toc: {
                depth: 3,
                searchDepth: 3
          }
        },
        highlight: { theme: 'dracula-soft' }
    },
    css: ['~/assets/css/tailwind.css', '~/assets/css/all.min.css'],
    head: {
        script: ['~/assets/js/all.min.js']
    },
    modules: ['@nuxt/content'],
    postcss: {
        plugins: {
            tailwindcss: {},
            autoprefixer: {}
        }
    },
    server: {
        host: process.env.NUXT_HOST,
        port: process.env.NUXT_PORT
    }
})
