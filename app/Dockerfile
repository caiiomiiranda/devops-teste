#Imagem Node.js
FROM node:14
#Diretório de trabalho
WORKDIR /usr/src/app
#Copia package.json
COPY package*.json ./
#Instalação de dependências
RUN npm install
#Copia os arquivos da app
COPY . .
#Exposição da porta da app
EXPOSE 3000
#Rodar a app
CMD [ "npm", "start" ]