FROM maven:3-jdk-8

MAINTAINER Jörg Unbehauen 

RUN apt-get update && apt-get install -y git

RUN git clone --branch v0.7.4 https://github.com/tomatophantastico/sparqlmap.git && cd sparqlmap && ./gradlew installDist
RUN cd sparqlmap && mkdir /opt/sparqlmap && mv sparqlmap-client/build/install/sparqlmap-client/* /opt/sparqlmap && cd .. && rm -r sparqlmap

COPY docker-entrypoint.sh  /opt/sparqlmap

RUN ln -s /opt/sparqlmap/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

EXPOSE 8080
 
ENTRYPOINT ["docker-entrypoint.sh"]

