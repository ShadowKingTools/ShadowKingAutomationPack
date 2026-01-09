# Quick Start (ShadowKingAutomationPack)

This repo is **safe by default**:
- No background services
- No system changes in the starter scripts
- Running the pack creates log files so you can verify what happened

## What you need
- Windows 10/11
- PowerShell 5.1+ (or PowerShell 7+)

## Download the repo
Option A (easy):
- Click the green **Code** button → **Download ZIP**
- Extract the ZIP to a folder (example: `C:\ShadowKingAutomationPack`)

Option B (git):
- `git clone <your-repo-url>`

## Run it (recommended)
1. Open **PowerShell** (not Command Prompt)
2. Go to the folder where the scripts are:
   - Example:
     - `cd C:\ShadowKingAutomationPack`
3. Run the pack:
   - `powershell -ExecutionPolicy Bypass -File .\RunPack.ps1`

### Verbose mode (shows live output)
- `powershell -ExecutionPolicy Bypass -File .\RunPack.ps1 -VerboseLog`

## What you should see after it runs
- A new folder: `logs\`
- A master log like:
  - `logs\RunPack_YYYY-MM-DD_HH-mm-ss.log`
- Routine logs like:
  - `logs\SessionPrep_...log`
  - `logs\LaunchStack_...log`
  - `logs\PerformanceProfile_...log`
  - `logs\CleanupSession_...log`
  - `logs\RestoreBaseline_...log`

## Troubleshooting
### “Running scripts is disabled…”
Run this once in PowerShell (Admin preferred), then try again:
- `Set-ExecutionPolicy RemoteSigned`

Or run the pack using the bypass command above.

### A routine says “MISSING”
That means one of the `.ps1` files isn’t in the same folder as `RunPack.ps1`.
Check the repo file list and spelling.

## Safety note
This is a starter framework. Future versions may add optional system changes,
but those will be clearly documented and should support a “dry-run” style mode.
