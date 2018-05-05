FROM openjdk:8-jre-alpine
ARG JAR_FILE
COPY ./target/${JAR_FILE} /usr/src/staging/app.jar
WORKDIR /usr/src/staging/
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]