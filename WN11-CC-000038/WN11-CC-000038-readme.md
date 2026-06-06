# STIG ID: WN11-CC-000038

## 🛡️ Vulnerability Description
**WDigest Authentication must be disabled.**

Windows Digest (WDigest) authentication is a legacy protocol that stores credentials in plaintext within the Local Security Authority Subsystem Service (LSASS) memory. If left enabled, attackers with local administrator access can easily harvest these credentials using tools like Mimikatz, leading to credential theft and network lateral movement.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
To remediate this vulnerability, the automation script targets the Windows Registry to enforce the security provider configuration.

1.  **Registry Targeting:** The script locates the path `HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest`.
2.  **Value Enforcement:** It checks for the registry value `UseLogonCredential`.
3.  **Modification:** The script sets this DWORD value to `0`. This explicitly tells Windows not to store credentials in memory for WDigest, effectively neutralizing the vector for memory scraping attacks.

---

## 📊 Rescan Verification Report
<img width="1916" height="861" alt="image" src="https://github.com/user-attachments/assets/e1527724-24fd-4205-b2b7-3b315d81ec20" />



---
