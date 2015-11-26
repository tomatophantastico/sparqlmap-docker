FROM java:openjdk-7-jdk

RUN mkdir /usr/sparqlmap
WORKDIR /usr/sparqlmap

RUN git clone https://github.com/tomatophantastico/sparqlmap-core/
RUN cd sparqlmap-core && git checkout feature/travisCi

RUN cd sparqlmap-core/ && ./gradlew -x test publishToMavenLocal

RUN git clone https://github.com/tomatophantastico/sparqlmap/ 

RUN cd sparqlmap/ && ./gradlew -x test installDist 

CMD /usr/sparqlmap/sparqlmap/build/install/sparqlmap/bin/sparqlmap -dburl $DB_URL -dbuser $DB_USER -dbpassword $DB_PASS