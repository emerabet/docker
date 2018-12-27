FROM node:8.14.1-alpine
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . ./
EXPOSE 3000
CMD ["npm", "run", "start"]