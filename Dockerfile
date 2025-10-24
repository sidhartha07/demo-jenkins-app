FROM openjdk:17-jdk-slim
EXPOSE 9090
COPY target/demo-jenkins-app.jar demo-jenkins-app.jar
ENTRYPOINT ["java","-jar","/demo-jenkins-app.jar"]