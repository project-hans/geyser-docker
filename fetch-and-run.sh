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

# If a configuration file is provided via ConfigMap, use it
if [ -f /geyser-config/config.yml ]; then
    CONFIG_OPTION="--config /geyser-config/config.yml"
else
    CONFIG_OPTION=""
fi

# Run the Geyser jar
java -Xms1024M -jar /app/Geyser.jar $CONFIG_OPTION --nogui
