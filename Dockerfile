FROM ubuntu:20.04
ENV DEBIAN_FRONTEND noninteractive
USER root

RUN apt-get update
RUN apt-get install -y wget gnupg dpkg
RUN wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/4.4 main" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
RUN apt-key list
RUN apt-get update

COPY libcurl3_7.47.0-1ubuntu2.13_amd64.deb ./
RUN apt-get install -y libgssapi-krb5-2 libidn11 librtmp1

RUN wget http://snapshot.debian.org/archive/debian/20190501T215844Z/pool/main/g/glibc/multiarch-support_2.28-10_amd64.deb
RUN dpkg -i multiarch-support*.deb

RUN wget http://snapshot.debian.org/archive/debian/20170705T160707Z/pool/main/o/openssl/libssl1.0.0_1.0.2l-1%7Ebpo8%2B1_amd64.deb
RUN dpkg -i libssl1.0.0*.deb

RUN dpkg -i libcurl3_7.47.0-1ubuntu2.13_amd64.deb
RUN apt-get install -y mongodb-org*
RUN apt-get install -y netcat

WORKDIR /home/tutorial/
RUN mkdir .tutorial \
 && mkdir .tutorial/bin \
 && mkdir .tutorial/logs

WORKDIR /home/tutorial