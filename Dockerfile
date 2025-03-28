# Use Ubuntu as the base image
FROM ubuntu:22.04

# Set the working directory
WORKDIR /app

# Update package lists (as a separate step)
RUN apt update

# Install required dependencies (as a separate step)
RUN apt install -y wget unzip git gradle openjdk-21-jdk

# Set JAVA_HOME
ENV JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Copy Omni-Notes project into the container
COPY . /app

# Set executable permission for Gradle wrapper
RUN chmod +x ./gradlew

# Default command to build the project
CMD ["./gradlew", "assembleDebug"]