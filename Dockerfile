# base image
FROM node:8.9.4

# set working directory
WORKDIR /app

# install and cache app dependencies
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM nginx:alpine
COPY --from=node /app/dist/ng7 /usr/share/nginx/html
