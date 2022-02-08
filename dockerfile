#permet de definir l'image que je souhaite utiliser. 
FROM debian:9

#exécute la commande souhaité. 
RUN apt-get update -yq \
&& apt-get install curl gnupg -yq \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash \
&& apt-get install nodejs -yq \
&& apt-get clean -y

#permet de copie ou télécharger les images ici dans le dossier app
ADD . /app/
#Permet de modifier le répertoir courant
WORKDIR /app
#Cette commande nous permet d'installer le package
RUN npm install

#Indique la port sur lequel notre application reçoit
EXPOSE 2368
#Indique quel répertoir nous ouhaitons partager avec notre hote
VOLUME /app/logs

#le CMD permet au container de s'avoir qu'elle est la commande à éxecuter au démarrage
CMD npm run start