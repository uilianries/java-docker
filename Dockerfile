FROM maven:3-jdk-8

MAINTAINER Uilian Ries <uilian.ries@cwi.com.br>

# Install apt packages
RUN apt-get update && apt-get -qq -y install \
    apt-utils \
    build-essential \
    curl \
    apt-utils \
    python-pip \

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - > /dev/null
RUN apt-get -qq -y install nodejs > /dev/null

# Install npm packages
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc

# Install pip packages
RUN pip install -q pexpect
