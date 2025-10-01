@echo off
echo Starting AI Interviewer Backend...
echo.

cd backend

echo Checking if virtual environment exists...
if not exist "venv" (
    echo Creating virtual environment...
    python -m venv venv
)

echo Activating virtual environment...
call venv\Scripts\activate

echo Installing dependencies...
pip install -r requirements.txt

echo.
echo Checking for .env file...
if not exist ".env" (
    echo WARNING: .env file not found!
    echo Please copy .env.example to .env and add your Gemini API key
    echo.
    pause
    exit /b 1
)

echo.
echo Starting FastAPI server...
echo Backend will be available at: http://localhost:8000
echo API documentation at: http://localhost:8000/docs
echo.

python main.py

pause
