FROM node:14-alpine
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM nginx:1.23.2
WORKDIR /usr/share/nginx/html/
COPY --from=0 /app/build/  .
