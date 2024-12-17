FROM node:18 AS build
WORKDIR /app
COPY package*.json ./
RUN npm i 
COPY . .
RUN npm run build
FROM nginx:alpine
COPY  --from=build /app/build /usr/share/nginx/html
EXPOSE 5000
CMD [ "nginx", "-g","daemon off;" ]