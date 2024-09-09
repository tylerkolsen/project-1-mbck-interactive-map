/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      // Allowing for more than 12 columns in the grid pattern
      gridTemplateColumns: {
        '103': 'repeat(103, minmax(0, 1fr))',
      },
      backgroundImage: {
        'map': "url('/mbck-map.jpg')",
      }
    },
  },
  plugins: [],
}
