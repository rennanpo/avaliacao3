FROM node:lts-alpine
WORKDIR /app
COPY app/package*.json ./
RUN yarn install --production
COPY app/ .
EXPOSE 3000
CMD ["node", "src/index.js"]