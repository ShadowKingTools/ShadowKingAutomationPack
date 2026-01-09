# Security Policy

## Supported Versions
This project is currently in **active development**.

We generally support:
- The latest version on the `main` branch
- The most recent tagged release (when releases start)

If you found an issue on an older commit, please retest on `main` first.

## Reporting a Vulnerability

### Preferred (private): GitHub Security Advisory
If the **“Report a vulnerability”** button is available on the repo’s Security tab, please use it.
This allows private disclosure and coordinated fixes.

### If private reporting is not available
If private reporting is not enabled, please do **not** open a public Issue with exploit details.

Instead:
1. Open a GitHub Issue with the title: **“Security report (private details requested)”**
2. In the Issue body, include **only**:
   - A short summary (no steps, no payloads, no screenshots that expose secrets)
   - What file(s) are impacted (example: `RunPack.ps1`)
   - Your GitHub username (so we can contact you)
3. We will reply and request details in a safer channel.

## What to Include in Your Report
Please include:
- A clear description of the vulnerability
- Steps to reproduce (safe PoC only)
- Expected vs actual behavior
- Affected script(s) / file paths
- Any security impact (e.g., command injection, privilege escalation, unsafe downloads)

## Scope
**In scope**
- PowerShell scripts (`*.ps1`) and batch files (`*.bat`) in this repository
- Documentation that instructs users how to run scripts

**Out of scope**
- Issues caused by user modifications outside the repo
- Problems from third-party tools or drivers not distributed by this repo
- Social engineering or physical access scenarios

## Safe-by-Default Design Notes
This repository aims to be:
- Transparent (source visible)
- Minimal permissions (no admin required for starter)
- No background services / no telemetry in starter scripts
- Changes, when added later, should be documented and ideally support a dry-run mode

## Coordinated Disclosure
Please allow a reasonable time for investigation and a fix before sharing publicly.
We will credit reporters when appropriate (unless you request otherwise).
