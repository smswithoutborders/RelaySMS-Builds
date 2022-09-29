FROM node:14-alpine as build-stage
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=build-stage /app/build .
CMD ["nginx", "-g", "daemon off;"]