FROM mdsol/java17-jre:latest
COPY target/listen-app.jar listen-app.jar
EXPOSE 6702
ENTRYPOINT ["java","-jar","listen-app.jar","&"]