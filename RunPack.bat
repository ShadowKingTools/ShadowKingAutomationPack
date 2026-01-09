@echo off
setlocal

REM Run ShadowKingAutomationPack (safe starter)
REM Uses Bypass so it runs even if execution policy is restricted on the machine.

set "ROOT=%~dp0"
set "PS1=%ROOT%RunPack.ps1"

powershell.exe -NoProfile -ExecutionPolicy Bypass -File "%PS1%" -VerboseLog

echo.
echo Done. Logs are in: "%ROOT%logs"
pause
