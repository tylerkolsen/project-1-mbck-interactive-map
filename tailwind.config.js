/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      // Allowing for more than 12 columns in the grid pattern
      screens: {
        "shorty": {"raw": "(max-height:800px)"}
      },
      gridTemplateColumns: {
        '103': 'repeat(103, minmax(0, 1fr))',
      },
      fontFamily: {
        taxonRegular: ["Taxon-Regular", "sans-serif"],
        taxonBold: ["Taxon-Bold", "sans-serif"]
      },
      colors: {
        // Dark Background Blue - High Darkness
        bBFullDark: "#002F47",
        // Dark Background Blue - Medium Darkness
        bBDark: "#005A87",
        // Human Hair Blue, Light
        hBLight: "#19A0E4",
        // Human Hair Blue, Dark
        hBDark: "#0251AE",
        // Dragon Blue, Light
        dBLight: "#39B3B8",
        // Dragon Blue, Dark
        dBDark: "#306C91",
        // Human Cape Red, Light
        hRLight: "#E30E3A",
        // Human Cape Red, Dark
        hRDark: "#AE144A",
        // Lion Mane Red, Light
        lRLight: "#BD444D",
        // Lion Mane Red, Dark
        lRDark: "#851C2A",
        // Snake Red, Light
        sRLight: "#F8574D",
        // Snake Red, Dakr
        sRDark: "#CF1B29",

        // Map Text Dark
        mYDark: "#FFBF43",
        // Map Text Light
        mYLight: "#FFFE80",
        // Map Text Outline
        mBrDark: "#4F2C02",
        // Map Outline Green
        mGLight: "#96BF78",
        // Map Outline Yellow
        mYOutline: "#FFE47E",
        // Cloud Dark
        cWDark: "#E8E5A3",
        // Cloud Light
        cWLight: "#FEFFD2",
        // Forest Dark
        fGrDark: "#838E56",
        // Forest Light
        fGrLight: "#93A25E",
        // Crystal Dark
        cPDark: "#D7BDA8",
        // Crystal Light
        cPLight: "#F6DCC5",
        // Crystal Border
        cPBorder: "#3B322A",
        // Forest Dark Green Compare
        fGrFullDark: "#9CC201",
        // Onyx
        onyx: "#2E3532"
      }
    },
  },
  plugins: [],
}
