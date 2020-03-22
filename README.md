#docker-felix


Docker image source project for a preconfigured apache felix installation

##Features

Provides:
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

##Environnment

Felix install location configured at
````
${FELIX_HOME}=/opt/osgi/felix-framework
````

##Volumes

Volume for file install configured at:
````
${FILE_INSTALL_EXTDIR]=/var/felix/fileinstall
````

============
###Port

Preconfigured ports
````
${FELIX_WEBCONSOLE_PORT}=8080
${FELIX_REMOTESHELL_PORT}=666
````

###Using

Add additional bundles when using in a image at ${FELIX_HOME}/load
Add additional configurations or bundles at run time at ${FILE_INSTALL_EXTDIR}
