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
        '102': 'repeat(102, minmax(0, 1fr))',
      }
    },
  },
  plugins: [],
}
