FROM node:lts-bookworm-slim

COPY . /usr/src/app

WORKDIR /usr/src/app

ARG API_URL

RUN npm install -g @angular/cli

RUN npm install

RUN npm run build

RUN sed -i 's|http://localhost:8080|'${API_URL}'|g' ./src/app/services/ApiService.ts

EXPOSE 4200

CMD ["ng", "serve", "--host", "0.0.0.0"]
