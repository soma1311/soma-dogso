#!/bin/bash
cd /opt/dogbreedshow

# Activate the virtual environment
source myenv/bin/activate

# Install dependencies (optional, if not already installed)
pip install -r requirements.txt

# Start the Flask application
python3 app.py &
