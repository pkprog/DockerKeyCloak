FROM ubuntu:21.04

MAINTAINER Pavel Khizhnyakov
LABEL version=5

ENV TZ=Europe/Moscow

#java
RUN apt-get update && \
    apt-get install -y openjdk-11-jdk && \
    apt-get clean;

#ENV JAVA_HOME=/usr/bin/java

#KeyCloak на 8080 порту, потому что offset=0
ADD ./dist/keycloak-16.1.0.tar.gz /etc/keycloak
#CMD /etc/keycloak/keycloak-16.1.0/bin/add-user-keycloak.sh -r master -u admin -p admin
CMD /etc/keycloak/keycloak-16.1.0/bin/standalone.sh -Djboss.socket.binding.port-offset=0 -b=0.0.0.0
EXPOSE 8080
