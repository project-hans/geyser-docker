#!/bin/sh

# Fetch the latest Geyser version using the public API
LATEST_VERSION=$(curl -s -L 'https://download.geysermc.org/v2/projects/geyser' -H 'Accept: application/json' | jq -r '.versions[-1]')

# Define the download URL for the latest version
GEYSER_URL="https://download.geysermc.org/v2/projects/geyser/versions/${LATEST_VERSION}/builds/latest/downloads/standalone"

# Download the latest Geyser jar to a temporary directory
curl -L -o /tmp/Geyser.jar $GEYSER_URL

# Move the downloaded jar to the app directory (backed by PVC)
mv /tmp/Geyser.jar /app/Geyser.jar

# Set appropriate permissions
chmod 755 /app/Geyser.jar

# Copy config.yml from the temporary directory to the writable PVC-backed directory
if [ -f /config-temp/config.yml ]; then
    cp /config-temp/config.yml /app/config.yml
fi

# Set the data directory (PVC-backed)
DATA_DIR="/app"

# Run the Geyser jar, pointing to the writable config file and data directory
java -Xms1024M -jar /app/Geyser.jar --config $DATA_DIR/config.yml --nogui