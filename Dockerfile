FROM node:14-alpine
WORKDIR /app
COPY . .
RUN yarn
RUN yarn build

FROM nginx:stable
WORKDIR /usr/share/nginx/html/
COPY --from=0 /app/build/  .
