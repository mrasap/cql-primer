# Original: https://github.com/DBCG/cql_execution_service/blob/master/Dockerfile
FROM maven:3.5.3-jdk-8 as builder

RUN git clone https://github.com/DBCG/cql_execution_service.git build
#COPY . /build

# overwrite CORS settings
COPY ./webapp /build/src/main/webapp

WORKDIR /build
RUN mvn package -Dmaven.test.skip=true

#Use the tomcat image as a base
FROM tomcat:8.5.13-jre8 as runner

#move the WAR for contesa to the webapps directory
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder ./build/target/CQLExecSvc-1.4.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
COPY --from=builder ./build/src/main/resources/* /usr/local/tomcat/src/main/resources/