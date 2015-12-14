# sparqlmap-docker
A Docker wrapper around sparqlmap

## Mysql

This is a modified file from docker-library [github page: https://github.com/docker-library/mysql/blob/ac05512a1b788e8ae658d0f4a980ff7a01a51c93/5.6/Dockerfile]
### Build an Run

This dockerfile build a running mysql database. You can build it with  
``sudo docker build -t mysql . ``

This create a MySQL image with contain the database benchmark. If you want to see the sql file , you can find them in the folder dataset.

You can start this image with

``sudo docker run -p 172.17.42.1:3306:3306 mysql ``

-p 172.17.42.1:3306:3306  create a one directional linking. So you can use mysql workbench or an other docker image to connect with this mysql-server.

The default data are:

    ip: 172.17.42.1
    port: 3306
    user: admin
    password: password

## Add data

You can add other database/data. Create a sql file ( for example mydatabase.sql). This file should be like this template:

    CREATE DATABASE IF NOT EXISTS 'database' ;
    use 'database';
    DROP TABLE IF EXISTS 'database';
    CREATE TABLE 'database'(
      ...
      );

    INSERT INTO 'database' VALUES (....);

After saving this file you open the file import_data.sh and add the line
    ``mysql < /tmp/file.sql``

Next you must build the image and run it.

## sparqlmap
SparqlMap - A SPARQL to SQL rewriter based on R2RML specification.

### Change Config

You can find the config data in the file db.properties. This file include
the jdbc url, username and password. Before build you must change it to your database. Default it works
with the mysql docker.

    jdbc.url=jdbc:mysql://172.17.42.1:3306/benchmark?padCharsWithSpace=true&sessionVariables=sql_mode='ANSI_QUOTES'
    jdbc.username=admin
    jdbc.password=password
    jdbc.poolminconnections=5
    jdbc.poolmaxconnections=20

### Build and Run

You can build the image with
 ``sudo docker  build -t sparqlmap .``

 and run the image with
 ``sudo docker run sparqlmap``

 After this sparqlmap generate a r2rml file and write it in the terminal.
