FROM node:lts-alpine
WORKDIR /app
COPY app/ .  # Copia apenas o conteúdo da pasta app para dentro do container
RUN yarn install --production
CMD ["node", "src/index.js"]
EXPOSE 3000