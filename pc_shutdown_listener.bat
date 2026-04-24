@echo off
:: ===========================================
:: Remote PC Shutdown Listener
:: This script checks the cloud every 5 seconds
:: for a shutdown command from your phone.
:: ===========================================

:: CONFIGURATION - DO NOT SHARE THESE VALUES
set "API_URL=https://runtime.codewords.ai/run/remote_pc_shutdown_aafcdb47"
set "TOKEN="
set "API_KEY=YOUR_API_KEY_HERE"

:: Check if API key is configured
if "%API_KEY%"=="YOUR_API_KEY_HERE" (
    echo.
    echo [ERROR] You need to set your API key first!
    echo.
    echo 1. Go to: https://codewords.agemo.ai/account/keys
    echo 2. Copy your API key (starts with cwk-)
    echo 3. Open this file in Notepad
    echo 4. Replace YOUR_API_KEY_HERE with your key
    echo 5. Save and run again
    echo.
    pause
    exit /b 1
)

echo =============================================
echo   Remote PC Shutdown Listener - ACTIVE
echo =============================================
echo.
echo Listening for shutdown commands...
echo Phone control: https://codewords.agemo.ai/run/remote_pc_shutdown_aafcdb47
echo Press Ctrl+C to stop
echo.

:loop
:: Use PowerShell to make the HTTP request and check response
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
    "$headers = @{ 'Authorization' = 'Bearer %API_KEY%'; 'Content-Type' = 'application/json' }; ^
    $body = '{\"token\":\"%TOKEN%\", \"action\":\"check\"}'; ^
    try { ^
        $response = Invoke-RestMethod -Uri '%API_URL%' -Method POST -Headers $headers -Body $body -TimeoutSec 15; ^
        if ($response.shutdown -eq $true) { ^
            Write-Host '[!] SHUTDOWN COMMAND RECEIVED - Shutting down in 5 seconds...'; ^
            shutdown /s /t 5 /c 'Remote shutdown command received'; ^
            exit 99; ^
        } else { ^
            Write-Host (Get-Date -Format 'HH:mm:ss') '- No commands. Waiting...'; ^
        } ^
    } catch { ^
        Write-Host (Get-Date -Format 'HH:mm:ss') '- Connection error, retrying...'; ^
    }"

:: Check if PowerShell exited with 99 (shutdown triggered)
if %errorlevel%==99 (
    echo Shutdown initiated. Goodbye!
    timeout /t 5 /nobreak >nul
    exit /b 0
)

:: Wait 5 seconds before next check
timeout /t 5 /nobreak >nul
goto loop
