#!/bin/bash

echo "Starting deployment script..."

# Define the deployment directory
DEPLOY_DIR="/opt/dogbreedshow"
ZIP_FILE="/opt/codedeploy-agent/deployment-root/*/*/deployment-archive/application.zip"

# Ensure the target directory exists
mkdir -p "$DEPLOY_DIR"

# Extract the ZIP file
echo "Extracting application.zip..."
unzip -o "$ZIP_FILE" -d "$DEPLOY_DIR"

# Change to the application directory
cd "$DEPLOY_DIR" || exit

# Activate the virtual environment
echo "Activating virtual environment..."
source myenv/bin/activate

# Install dependencies (optional, if not already installed)
echo "Installing dependencies..."
pip install -r requirements.txt

# Start the Flask application
echo "Starting Flask application..."
nohup python3 app.py > app.log 2>&1 &

echo "Deployment completed successfully."
