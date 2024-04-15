# Base image for the build stage
FROM maven:3.8.2-jdk-11 AS build

# Set the working directory to /app
WORKDIR /app

# Copy the project files to the working directory
COPY . .

# Run the Maven clean package command with the production profile, skipping tests
RUN mvn clean package -Pprod -DskipTests || cat target/surefire-reports/*.txt

# Base image for the final stage
FROM openjdk:11-jdk-slim

# Copy the built JAR file from the build stage
COPY --from=build /app/target/DogsManagementSystem-0.0.1-SNAPSHOT.jar DogsManagementSystem.jar

# Define the command to run the application
CMD ["java", "-jar", "DogsManagementSystem.jar"]
