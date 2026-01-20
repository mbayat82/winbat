@echo off
:: Check for administrative privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    goto :runScript
) else (
    goto :getAdmin
)

:getAdmin
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b

:runScript
    echo Launching Chris Titus Tech Windows Utility...
    powershell -Command "irm christitus.com/win | iex"
    pause
