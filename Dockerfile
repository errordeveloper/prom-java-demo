FROM maven:3.5-jdk-8-alpine as BUILD

COPY . /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8-jdk-alpine
COPY --from=BUILD /usr/src/app/target/prom-java-demo-0.0.1-SNAPSHOT.jar /opt/app.jar
WORKDIR /opt
CMD ["java", "-jar", "app.jar"]
