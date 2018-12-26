FROM node:8.14.1-alpine
RUN apk add yarn
WORKDIR /app
COPY . .
RUN yarn install
CMD ["yarn", "start"]

# docker run -it --rm -v $(pwd):/app img-name
