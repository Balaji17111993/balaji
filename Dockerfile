FROM ubuntu:16.04
MAINTAINER "Gamut Gurus Technologies"
RUN apt-get update
RUN apt-get install -y openssh-server
RUN apt-get install sudo
RUN useradd -m -d /home/gamut -s /bin/bash gamut
RUN echo "gamut:gamut" | chpasswd
RUN sed -i '21i gamut    ALL=(ALL:ALL) ALL' /etc/sudoers
USER gamut
WORKDIR /home/gamut
ENTRYPOINT echo gamut | sudo -S service ssh start && /bin/bash
RUN cd /home/gamut
RUN wget https://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jdk-8u201-linux-x64.tar.gz
RUN gzip jdk-8u201-linux-x64.tar.gz
ENV JAVA_HOME /home/gamut/jdk1.8.0_201
RUN export JAVA_HOME
RUN cd /home/gamut
RUN wget http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.39/bin/apache-tomcat-8.5.39.tar.gz
RUN gzip apache-tomcat-8.5.39.tar.gz
RUN chmod 777 /home/gamut/apache-tomcat-8.5.38
