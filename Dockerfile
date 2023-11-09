FROM alpine:latest
RUN apk --no-cache add openjdk17-jdk
EXPOSE 6702
COPY target/listen-app-0.0.1-SNAPSHOT.jar /app/listen-app.jar
WORKDIR /app
ENTRYPOINT ["java", "-jar", "listen-app.jar"]