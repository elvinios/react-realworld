FROM node:16 AS build

COPY . .

WORKDIR realworld-example 

RUN yarn install && yarn build


FROM nginx:alpine AS server

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build ./realworld-example/build /usr/share/nginx/html

# Test


