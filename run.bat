@echo off
setlocal

rem Move to main directory
cd /D "%~dp0"

rem Set the directory where you want to create the virtual environment
set "venv_dir=venv"

rem Set the path to your Python executable
set "python_executable=python"

rem Check if virtual environment already exists
if not exist "%venv_dir%\Scripts\activate.bat" (
    echo Creating virtual environment...
    %python_executable% -m venv "%venv_dir%"
)

rem Activate the virtual environment
call "%venv_dir%\Scripts\activate.bat"

rem Install required packages from requirements.txt
echo Installing required packages...
pip install -r requirements.txt

rem Run your Python script
echo Running Python script...
python erpnext_sync.py

rem Deactivate virtual environment
deactivate

endlocal
