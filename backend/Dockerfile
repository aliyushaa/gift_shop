FROM maven:3.8.4-openjdk-17 AS build
ENV JAVA_OPTS="-Xmx512m -Xms256m"
WORKDIR /app
COPY ./backend .
RUN mvn clean package -DskipTests
RUN cp target/*.jar app.jar

FROM openjdk:17-alpine
COPY --from=build /app .
EXPOSE 1999
ENTRYPOINT [ "java", "-jar", "app.jar" ]
