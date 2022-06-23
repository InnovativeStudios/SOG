/** @type {import('tailwindcss').Config} */

const colors = require('tailwindcss/colors')

module.exports = {
  content: [
    './assets/**/*.css',
    './assets/**/*.scss',
    './components/**/*.{js,vue,ts}',
    './content/**/*.{md,yml,json,yaml,toml,csv}',
    './layouts/**/*.vue',
    './pages/**/*.vue',
    './plugins/**/*.{js,ts}'
  ],
  theme: {
    colors: {
      transparent: 'transparent',
      current: 'currentColor',
      black: colors.black,
      white: colors.white,
      slate: colors.slate,
      gray: colors.slate,
      zinc: colors.zinc,
      neutral: colors.neutral,
      stone: colors.stone,
      red: colors.red,
      green: colors.green,
      blue: colors.blue,
      yellow: colors.yellow,
      sky: colors.sky
    },
    extend: {}
  },
  plugins: [
    require('@tailwindcss/typography')
  ]
}
