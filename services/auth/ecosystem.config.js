module.exports = {
  apps: [
    {
      name: 'auth-app',
      script: './dist/index.js',
      instances: 'max', // ou especifique um número, ex.: 2
      exec_mode: 'cluster', // ativa o modo cluster para usar múltiplas CPUs
      env: {
        NODE_ENV: 'production'
      }
    }
  ]
};
