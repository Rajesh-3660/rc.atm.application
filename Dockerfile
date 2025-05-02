# ----------- Stage 1: Build WAR using Maven -----------  
FROM maven:3.9.3-eclipse-temurin-17 AS builder

# Set working directory
WORKDIR /app

# Copy Maven project files
COPY pom.xml .
COPY src ./src

# Build WAR (skip tests to speed up build)
RUN mvn clean package -DskipTests


# ----------- Stage 2: Deploy WAR on Tomcat 10 (Jakarta EE 10 compatible) -----------  
FROM tomcat:10.1-jdk17-corretto

# Clean default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR to deploy at root context (ROOT.war)
COPY --from=builder /app/target/ATM_Application_New-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
