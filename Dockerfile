# Stage 1 : Build
FROM node:24-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2 : Production
FROM nginx:alpine

# Copier le dossier dist du stage build vers nginx
COPY --from=build /app/dist /usr/share/nginx/html

# Copier la configuration Nginx
COPY nginx/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
