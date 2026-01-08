<#
CleanupSession.ps1
ShadowKingAutomationPack

Goal (safe starter):
- Write a clear log entry that cleanup ran
- Optionally clear TEMP folders (commented out by default)
- Provide a spot for future app/process cleanup steps

No system changes by default.
#>

[CmdletBinding()]
param(
  [switch]$VerboseLog
)

$ErrorActionPreference = "Stop"

# --- Paths ---
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$LogDir = Join-Path $Root "logs"
$null = New-Item -ItemType Directory -Force -Path $LogDir | Out-Null

$Timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$LogFile = Join-Path $LogDir "CleanupSession_$Timestamp.log"

function Write-Log {
  param([string]$Message)
  $line = "[{0}] {1}" -f (Get-Date -Format "HH:mm:ss"), $Message
  Add-Content -Path $LogFile -Value $line
  if ($VerboseLog) { Write-Host $line }
}

Write-Log "=== CleanupSession START ==="
Write-Log "Root: $Root"
Write-Log "Log:  $LogFile"

# --- Placeholder: Close apps / stop processes (SAFE: just notes) ---
Write-Log "Placeholder: close apps / stop processes (not implemented in starter)."

# --- Optional: Temp cleanup (COMMENTED OUT by default) ---
Write-Log "Optional temp cleanup is disabled by default."

# To enable, uncomment the block below:
<#
try {
  $tempPaths = @(
    $env:TEMP,
    $env:TMP
  ) | Where-Object { $_ -and (Test-Path $_) } | Select-Object -Unique

  foreach ($p in $tempPaths) {
    Write-Log "Temp path found: $p"
    # Remove temp files (be careful)
    # Get-ChildItem -Path $p -Force -ErrorAction SilentlyContinue | Remove-Item -Force -Recurse -ErrorAction SilentlyContinue
  }

  Write-Log "Temp cleanup completed (if enabled)."
}
catch {
  Write-Log "Temp cleanup error: $($_.Exception.Message)"
}
#>

Write-Log "=== CleanupSession END ==="
