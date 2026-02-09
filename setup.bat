@echo off
echo ============================================
echo  Code Assistant - Environment Setup
echo ============================================
echo.

:: Check Python is available
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not on PATH.
    echo Install Python 3.10+ from https://www.python.org/downloads/
    pause
    exit /b 1
)

:: Create virtual environment
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
) else (
    echo Virtual environment already exists, skipping creation.
)

:: Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

:: Install dependencies
echo Installing dependencies...
pip install -r requirements.txt

:: Create .env from sample if it doesn't exist
if not exist ".env" (
    if exist ".env.sample" (
        copy .env.sample .env
        echo.
        echo Created .env from .env.sample.
        echo IMPORTANT: Open .env and fill in your Azure OpenAI credentials before running.
    )
) else (
    echo .env file already exists, skipping.
)

echo.
echo ============================================
echo  Setup complete.
echo  Activate the environment with: venv\Scripts\activate
echo  Run the demo with: python -m code_assistant.demo
echo ============================================
pause