FROM ubuntu:14.04

### Install NPM v0.10.x ###
RUN apt-get update && apt-get install -y wget
RUN wget https://nodejs.org/dist/latest-v0.10.x/node-v0.10.46-linux-x64.tar.gz
RUN tar xfz node-v0.10.46-linux-x64.tar.gz
RUN ln -s /node-v0.10.46-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /node-v0.10.46-linux-x64/bin/npm /usr/local/bin/npm

### npm install canvas
RUN apt-get update && apt-get install -y libcairo2-dev libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++
#RUN npm cache clean -f
#RUN npm install -g n
#RUN n stable
RUN npm install canvas

### Add dependencies ###
RUN mkdir -p /var/app
ADD package.json /var/app/package.json
RUN cd /var/app && npm install
ADD . /var/app

ENV INFOSITE http://shields.io
WORKDIR /var/app
CMD npm run start
