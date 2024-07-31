#!/bin/bash

cd /opt/hive/lib

curl -#LO -v https://repo1.maven.org/maven2/software/amazon/awssdk/bundle/2.26.9/bundle-2.26.9.jar
curl -#LO -v https://repo1.maven.org/maven2/com/google/guava/guava/33.2.1-jre/guava-33.2.1-jre.jar
curl -#LO -v https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.4.0/hadoop-aws-3.4.0.jar
curl -#LO -v https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.4.0/hadoop-common-3.4.0.jar
curl -#LO -v https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.4.0/mysql-connector-j-8.4.0.jar
curl -#LO -v https://repo1.maven.org/maven2/org/postgresql/postgresql/42.7.3/postgresql-42.7.3.jar
