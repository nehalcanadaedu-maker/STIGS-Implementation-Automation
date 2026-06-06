# STIG ID: WN11-CC-000326

## 🛡️ Vulnerability Description
**PowerShell Script Block Logging must be enabled.**

Without Script Block Logging, security teams lack visibility into the actual code executed by PowerShell. Attackers often use obfuscated scripts to hide their intent. Enabling this feature forces Windows to log the de-obfuscated code to the event log as it executes, providing critical telemetry for detecting "living-off-the-land" attacks.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
The remediation script enforces a Group Policy setting via the Registry to ensure logging is active system-wide.

1.  **Path Validation:** The script navigates to `HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging`. If the key does not exist, the script creates it.
2.  **Enabling Logging:** It sets the `EnableScriptBlockLogging` DWORD value to `1`.
3.  **Result:** This forces the PowerShell engine to generate Event ID 4104 in the Event Viewer for all script blocks processed.


---

## 📊 Rescan Verification Report

<img width="1912" height="867" alt="image" src="https://github.com/user-attachments/assets/42d3a243-9b8e-4c82-abe4-a95fbdc1e265" />

---
