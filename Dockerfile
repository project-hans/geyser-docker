# Use an official OpenJDK image with Java 21
FROM eclipse-temurin:21-jdk

# Set the working directory in the container
WORKDIR /app

# Accept the Geyser version as a build argument
ARG GEYSER_VERSION

# Download the specific Geyser-Standalone jar file
ADD https://download.geysermc.org/v2/projects/geyser/versions/${GEYSER_VERSION}/builds/latest/downloads/standalone /app/Geyser.jar

# Create necessary directories, set permissions, and change ownership
RUN mkdir -p /app/logs /app/extensions /app/custom_mappings /app/packs /app/cache && \
    chmod -R 755 /app && \
    chown -R 1000:1000 /app

# Set the container's user to a non-root user
USER 1000

# Label the image with the Geyser version
LABEL org.opencontainers.image.version=${GEYSER_VERSION}

# Expose the default Geyser and Minecraft ports
EXPOSE 19132/udp 25565

# Run Geyser-Standalone when the container starts
CMD ["java", "-Xms512M", "-Xmx1024M", "-jar", "Geyser.jar", "nogui"]
