import { defineConfig } from '@farmfe/core';

export default defineConfig({
  server: {
    port: 3000
  },
  compilation: {
    presetEnv: false
  }
});
