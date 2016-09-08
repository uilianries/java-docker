FROM maven:3-jdk-8

MAINTAINER Uilian Ries <uilian.ries@gmail.com>

# Install apt packages
RUN apt-get update && apt-get -qq -y install \
    apt-utils \
    build-essential \
    curl

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get -qq -y install nodejs

# Install npm packages
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc
