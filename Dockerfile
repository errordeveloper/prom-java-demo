FROM maven:3.5-jdk-8-alpine as BUILD

COPY . /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package

FROM openjdk:8u131-jre-alpine
COPY --from=BUILD /usr/src/app/target/prom-java-demo-0.0.1-SNAPSHOT.jar /opt/app.jar
WORKDIR /opt
CMD ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-XX:MaxRAMFraction=1", "-XX:+UseG1GC", "-jar", "app.jar"]
