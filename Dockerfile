FROM node:20-alpine AS build

WORKDIR /app

COPY package*.json ./
RUN npm install --no-audit --no-fund

COPY . .

ARG PUBLIC_URL=/
ENV PUBLIC_URL=${PUBLIC_URL}
RUN npm run build

FROM node:20-alpine

RUN npm install --global serve@14.2.4 --no-audit --no-fund

WORKDIR /app
COPY --from=build /app/build ./build

USER node
EXPOSE 3000
CMD ["serve", "-s", "/app/build", "-l", "tcp://0.0.0.0:3000"]