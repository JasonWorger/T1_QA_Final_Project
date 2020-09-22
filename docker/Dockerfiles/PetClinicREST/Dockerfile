
#Build stage

FROM maven:latest AS build-stage
WORKDIR /build
COPY ../../spring-petclinic-rest /build
RUN mvn clean package


#Run stage

FROM java:8 AS runtime
WORKDIR /ops/application
COPY --from=build-stage /build/target/spring-petclinic-rest-2.2.5.jar /app.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]
