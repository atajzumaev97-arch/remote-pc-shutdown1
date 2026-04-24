@echo off
echo =============================================
echo   Auto-Start Setup for PC Shutdown Listener
echo =============================================
echo.

:: Get the startup folder path
set "STARTUP=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Copy the VBS launcher to startup folder
copy "%~dp0run_hidden.vbs" "%STARTUP%\pc_shutdown_listener.vbs" >nul 2>&1

if %errorlevel%==0 (
    echo [OK] Auto-start configured successfully!
    echo.
    echo The listener will now start automatically when you log in.
    echo.
    echo To remove auto-start, delete this file:
    echo %STARTUP%\pc_shutdown_listener.vbs
) else (
    echo [ERROR] Could not set up auto-start.
    echo Please manually copy "run_hidden.vbs" to:
    echo %STARTUP%
)

echo.
pause
