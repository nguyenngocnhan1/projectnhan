# Stage 1: build
FROM node:20-alpine AS build
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Stage 2: runtime
FROM node:20-alpine
WORKDIR /app

COPY --from=build /app .

EXPOSE 86
CMD ["npm", "start"]
