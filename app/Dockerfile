#Image Node.js
FROM node:14
#Work Directory
WORKDIR /usr/src/app
#Copy package.json
COPY package*.json ./
#Install of dependencies
RUN npm install
#Copy files of app
COPY . .
#Expose app port
EXPOSE 3000
#Run a app
CMD [ "npm", "start" ]