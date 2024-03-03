# Geyser-MC Docker Container

This Docker container runs Geyser-MC, a bridge between Minecraft: Bedrock Edition and Minecraft: Java Edition, allowing Bedrock Edition players to join Minecraft Java Edition servers.

## Features

- **Java 17**: Utilizes OpenJDK 17, providing the latest security and performance improvements.
- **Automatic Updates**: The Dockerfile downloads the latest version of Geyser-Standalone, ensuring you always have the most recent features and fixes.
- **Port Exposure**: Exposes the default ports for Geyser (19132 UDP for Bedrock Edition) and Minecraft Java Edition (25565 TCP), making it easy to set up and connect.
- **Simplified Command**: The container automatically runs Geyser-Standalone without a graphical interface (`nogui`), optimized for server environments.

## Prerequisites

Before you begin, ensure you have Docker installed on your host machine. Visit [Docker's official installation guide](https://docs.docker.com/get-docker/) for instructions.

## Usage

1. **Build the Docker Image**:
   You can build the Docker image using the provided Dockerfile. Navigate to the directory containing the Dockerfile and run:

   ```bash
   docker build -t geyser-mc .

