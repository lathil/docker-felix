# Docker-felix

Project to build a base image with Apache felix and a minimal set of plugins.
Include:
- openjdk + base image of Debian
- Apache Felis distribution
- Additionnal bundles

The distribution of Felix is loaded from archive.apache.org during creation of the image. The set of plugins is loaded by launching Felix and gining it a list of plugin in a repository.xml OBR (Osgi Bundle repository ) file.
This repository file is created by the maven project included, and all links to felix bundled file are to their uri at maven central.

## To build:
- inspect the list of plugins and dependencies to load in pom.xml
- launch mvn build install - this will build the repository file at felixbundles/repository.xml (one is already included in the git repo)
- build the image with the three variant dockerfiles:
    - Dockerfile-jdk8-slim : openjdk 8 + debian buster slim amd64
    - Dockerfile-jdk8-slim-arm2v7 : openjdk 8 + debian buster slim amr32v7 ( build via buildx or quemu)
    - Dockerfile-jdk8-alpine : openjdk8 + alpine

## To run:
Use the two docker-compose file to experiment:
- docker-compose-alpine.yml
- docker-compose-slim.yml

## Features

List of plugins included:

- openjdk 1.8
- osgi.core
- osgi.cmpn
- Apache Geronimo Bundles: json-20090211
- Apache Commons FileUpload Bundle
- Apache Commons IO Bundle
- Apache Felix Configuration Admin Service
- Apache Felix File Install
- Apache Felix Metatype Service
- Apache Felix EventAdmin
- Apache Felix Log Service
- Apache Felix Http Api
- Apache Felix Http Jetty
- Apache Felix Http Whiteboard
- Apache Felix Dependency Manager
- Apache Felix Remote Shell
- Apache Felix Web Management Console
- Apache Felix Web Console Event Plugin
- Apache Felix Web Console Memory Usage Plugin

Base image debian slim or Alpine

## Felix version

Default version fixed at:
````
FELIX_VERSION=4.2.1
````

## Environnment

In case you want to add anything else, Felix install location configured at
````
${FELIX_HOME}=/opt/osgi/felix-framework
````

## Volumes

You can place additional bundles and configuration files on an exterlal location mapped to this volume:
````
${FILE_INSTALL_EXTDIR]=/var/felix/fileinstall
````

============
### Port

Preconfigured ports for Felix web admin console and remote shell port
````
${FELIX_WEBCONSOLE_PORT}=8080
${FELIX_REMOTESHELL_PORT}=666
````

### Using

Add additional bundles when using in a image at ${FELIX_HOME}/load
Add additional configurations or bundles at run time at ${FILE_INSTALL_EXTDIR}
