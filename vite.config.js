import { defineConfig } from 'vite';
import tailwindcss from '@tailwindcss/vite';

// Builds straight into dist/ with stable (unhashed) filenames, because
// Silverstripe templates reference these files by name through
// themedCSS()/themedJavascript(). dist/ is committed so sites installing the
// theme through composer don't need Node.
export default defineConfig({
  plugins: [tailwindcss()],
  publicDir: false,
  build: {
    outDir: 'dist',
    emptyOutDir: true,
    cssCodeSplit: true,
    rollupOptions: {
      input: {
        silverwind: 'src/js/silverwind.js',
        editor: 'src/css/editor.css',
      },
      output: {
        entryFileNames: '[name].js',
        chunkFileNames: '[name].js',
        assetFileNames: (asset) =>
          asset.names?.[0]?.endsWith('.css') ? '[name][extname]' : 'assets/[name][extname]',
      },
    },
  },
});
