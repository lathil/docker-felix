FROM ubuntu:14.04

MAINTAINER laurent Thil <lathil.dev@gmail.com>
# get Curl
RUN apt-get update && apt-get install -y curl
# get java 7 jdk
RUN apt-get install -y openjdk-7-jdk

RUN mkdir /opt/osgi && cd /opt/osgi
WORKDIR /opt/osgi
# Install felix distribution
RUN curl -O http://archive.apache.org/dist/felix/org.apache.felix.main.distribution-4.2.1.tar.gz && \
tar zxf org.apache.felix.main.distribution-4.2.1.tar.gz && rm org.apache.felix.main.distribution-4.2.1.tar.gz

ADD repository.xml /opt/osgi/felix-framework-4.2.1/conf/repository.xml
ADD configurations /opt/osgi/felix-framework-4.2.1/
ADD launch_felix.sh /opt/osgi/felix-framework-4.2.1/launch_felix.sh
ADD felix_config /opt/osgi/felix-framework-4.2.1/felix_config

WORKDIR /opt/osgi/felix-framework-4.2.1

RUN ./launch_felix.sh < felix_config

EXPOSE 8080

CMD ["java", "-Dgosh.args=--nointeractive", "-jar","bin/felix.jar"]
