FROM node:14-alpine as build-stage
WORKDIR /app
COPY ./frontend .
RUN yarn install
RUN yarn build

FROM nginx
WORKDIR /usr/share/nginx/html
COPY --from=build-stage /app/build .
COPY ./configs/nginx.conf /etc/nginx/conf.d/default.conf
CMD ["nginx", "-g", "daemon off;"]