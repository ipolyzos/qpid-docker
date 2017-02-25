FROM centos:centos7
MAINTAINER Ioannis Polyzos

EXPOSE 5672
EXPOSE 8080

RUN yum -y update; yum clean all;
RUN yum -y install epel-release; yum clean all;
RUN yum install -y tar java-1.7.0-openjdk-headless; yum clean all

RUN mkdir /usr/local/qpid
WORKDIR /usr/local/qpid

RUN curl -JOL http://mirrors.koehn.com/apache/qpid/java/6.0.0/binaries/qpid-broker-6.0.0-bin.tar.gz
RUN tar xvf qpid-broker-6.0.0-bin.tar.gz

RUN export QPID_WORK=/var/qpidwork

ENTRYPOINT ["qpid-broker/6.0.0/bin/qpid-server"]
