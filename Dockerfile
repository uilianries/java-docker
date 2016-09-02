FROM maven:3-jdk-8

MAINTAINER Uilian Ries <uilian.ries@cwi.com.br>

# Install apt packages
RUN apt-get update && apt-get -qq -y install \
    apt-utils \
    build-essential \
    curl \
    apt-utils \
    python-pip \
    ppp

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash - > /dev/null
RUN apt-get -qq -y install nodejs > /dev/null

# Install npm packages
RUN npm install -g bower
RUN echo '{ "allow_root": true }' > /root/.bowerrc

# Install pip packages
RUN pip install -q pexpect

# Install Forticlient
ADD https://hadler.me/files/forticlient-sslvpn_4.4.2329-1_amd64.deb /tmp
RUN dpkg -i /tmp/forticlient-sslvpn_4.4.2329-1_amd64.deb
COPY forticlient-auto /opt/forticlient-sslvpn/64bit/forticlient-auto
COPY forticlient /etc/init.d/forticlient
RUN update-rc.d forticlient defaults && update-rc.d forticlient enable
