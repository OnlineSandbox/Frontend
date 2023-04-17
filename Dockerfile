# Basis-Image
FROM node:17-alpine as builder

# Arbeitsverzeichnis im Image
WORKDIR /vue-ui

# Kopiere das Vue.js-Projekt in das Image
COPY . .

# Installiere die Abhängigkeiten und baue die Anwendung
RUN npm install
RUN npm run build

# Nginx-Image als Basis-Image
FROM nginx:alpine as production-build

# Kopiere die gebaute Anwendung in das Nginx-Verzeichnis
COPY --from=builder /vue-ui/dist /usr/share/nginx/html

# Kopiere die Nginx-Konfigurationsdatei in das Image
COPY ./.nginx/nginx.conf /etc/nginx/nginx.conf

## Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Port, auf dem Nginx lauscht
EXPOSE 80/tcp