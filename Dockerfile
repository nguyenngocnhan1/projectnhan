FROM node:20-alpine

WORKDIR /app

# Cài dependencies
COPY package*.json ./
RUN npm install --production

# Copy source code
COPY . .

EXPOSE 86
CMD ["npm", "start"]
