<#
RunPack.ps1
ShadowKingAutomationPack

Runs the routines in order:
1) SessionPrep
2) LaunchStack
3) PerformanceProfile
4) CleanupSession
5) RestoreBaseline

Safe starter: just orchestrates + logs. Each routine currently does no system changes.
#>

[CmdletBinding()]
param(
  [switch]$VerboseLog
)

$ErrorActionPreference = "Stop"

$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$LogDir = Join-Path $Root "logs"
$null = New-Item -ItemType Directory -Force -Path $LogDir | Out-Null

$Timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$MasterLog = Join-Path $LogDir "RunPack_$Timestamp.log"

function Write-Log {
  param([string]$Message)
  $line = "[{0}] {1}" -f (Get-Date -Format "HH:mm:ss"), $Message
  Add-Content -Path $MasterLog -Value $line
  if ($VerboseLog) { Write-Host $line }
}

function Run-Step {
  param(
    [string]$Name,
    [string]$ScriptFile
  )

  $Path = Join-Path $Root $ScriptFile
  if (-not (Test-Path $Path)) {
    Write-Log "MISSING: $Name ($ScriptFile)"
    throw "Missing script: $ScriptFile"
  }

  Write-Log "---- START: $Name ($ScriptFile) ----"
  if ($VerboseLog) {
  & $Path -VerboseLog
} else {
  & $Path
}
  
  Write-Log "---- END:   $Name ----"
}

Write-Log "=== RunPack START ==="
Write-Log "Root: $Root"
Write-Log "Log:  $MasterLog"

Run-Step "SessionPrep"        "SessionPrep.ps1"
Run-Step "LaunchStack"        "LaunchStack.ps1"
Run-Step "PerformanceProfile" "PerformanceProfile.ps1"
Run-Step "CleanupSession"     "CleanupSession.ps1"
Run-Step "RestoreBaseline"    "RestoreBaseline.ps1"

Write-Log "=== RunPack END ==="
