FROM node:20-alpine

WORKDIR /app

# Copie apenas os arquivos de package para aproveitar cache
COPY package*.json ./

# Instale as dependências
RUN npm install

# Copie o restante dos arquivos
COPY . .

# Build do TypeScript
RUN npm run build

# Expor a porta que sua aplicação utiliza (por exemplo, 3333)
EXPOSE 3333

# Iniciar a aplicação com PM2
CMD ["npm", "start"]
