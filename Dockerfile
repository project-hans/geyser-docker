# Use a lightweight base image with Java 22
FROM eclipse-temurin:22-jdk

# Install necessary tools (curl, jq)
RUN apt-get update && apt-get install -y curl jq && rm -rf /var/lib/apt/lists/*

# Create directories for the application and configuration
RUN mkdir -p /app /config

# Copy the script to fetch the latest version
COPY fetch-and-run.sh /fetch-and-run.sh
RUN chmod +x /fetch-and-run.sh

# Set the working directory
WORKDIR /app

# Run the fetch-and-run script at container start
ENTRYPOINT ["/fetch-and-run.sh"]

