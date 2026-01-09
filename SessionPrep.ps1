# SessionPrep.ps1
# ShadowKingAutomationPack - starter script

Write-Host "SessionPrep: starting..." -ForegroundColor Cyan

# Example: show date/time + machine info
Write-Host ("Time: " + (Get-Date))
Write-Host ("Computer: " + $env:COMPUTERNAME)
Write-Host ("User: " + $env:USERNAME)

Write-Host "SessionPrep: done." -ForegroundColor Green
exit 0
