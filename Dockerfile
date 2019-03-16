FROM node:alpine as builder 
#'as builder' is a phase of container (Build an production file before run in nginx)'
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html