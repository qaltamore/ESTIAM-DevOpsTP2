#Image
FROM debian:jessie

#Création du dossier de l'application
WORKDIR /usr/src/app

# Installation de curl avec apt-get
RUN apt-get update \
&& apt-get install -y curl \
&& rm -rf /var/lib/apt/lists/*

# Installation de Node.js à partir du site officiel
RUN curl -LO "https://nodejs.org/dist/v11.9.0/node-v11.9.0-linux-x64.tar.gz" \
&& tar -xzf node-v11.9.0-linux-x64.tar.gz -C /usr/local --strip-components=1 \
&& rm node-v11.9.0-linux-x64.tar.gz

# Ajout du fichier de dépendances package.json
ADD package.json ./

# Installation des dépendances
RUN npm install

# Ajout des sources
ADD . .

# On expose le port 8080
EXPOSE 8080

CMD node server.js