FROM node:18-alpine AS build
WORKDIR /app
COPY app/package*.json app/yarn.lock* ./
RUN npm ci --omit=dev
COPY app/ .

FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
ENV NODE_ENV=production PORT=3000
EXPOSE 3000
CMD ["node", "src/index.js"]