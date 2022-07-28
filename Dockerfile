FROM node:16 AS build

COPY . .

WORKDIR realworld-example 

RUN yarn install && yarn build

RUN mv ./realworld-example/build ../../


FROM nginx:alpine AS server

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build ../../build /usr/share/nginx/html

# Test Test


