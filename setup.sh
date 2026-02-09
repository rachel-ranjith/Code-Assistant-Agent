#!/bin/bash
echo "============================================"
echo "  Code Assistant - Environment Setup"
echo "============================================"
echo

# Check Python is available
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python 3 is not installed or not on PATH."
    echo "Install Python 3.10+ from https://www.python.org/downloads/"
    exit 1
fi

# Create virtual environment
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
else
    echo "Virtual environment already exists, skipping creation."
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Create .env from sample if it doesn't exist
if [ ! -f ".env" ] && [ -f ".env.sample" ]; then
    cp .env.sample .env
    echo
    echo "Created .env from .env.sample."
    echo "IMPORTANT: Open .env and fill in your Azure OpenAI credentials before running."
elif [ -f ".env" ]; then
    echo ".env file already exists, skipping."
fi

echo
echo "============================================"
echo "  Setup complete."
echo "  Activate the environment with: source venv/bin/activate"
echo "  Run the demo with: python -m code_assistant.demo"
echo "============================================"