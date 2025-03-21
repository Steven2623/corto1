FROM openjdk:17 AS cons

WORKDIR /app

COPY . .

RUN chmod +x mvnw && ./mvnw clean package -DskipTests

# Ejecutamos la aplicación con OpenJDK 17

FROM openjdk:17

WORKDIR /app

COPY --from=cons /app/target/*.jar app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
