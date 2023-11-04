FROM mdsol/java17-jre:latest
ADD target/listen-app-0.0.1-SNAPSHOT.jar listen-app.jar
EXPOSE 6702
ENTRYPOINT ["java","-jar","listen-app.jar","&"]