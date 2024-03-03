# Use an official OpenJDK image with Java 17
FROM openjdk:17-slim

# Set the working directory in the container
WORKDIR /app

# Download the latest Geyser-Standalone jar file
ADD https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone /app/Geyser.jar

# Expose the default Geyser and Minecraft ports
EXPOSE 19132/udp 25565

# Run Geyser-Standalone when the container starts
CMD ["java", "-Xms512M", "-Xmx1024M", "-jar", "Geyser.jar", "nogui"]
