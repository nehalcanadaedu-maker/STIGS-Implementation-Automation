# STIG ID: WN11-CC-000350

## 🛡️ Vulnerability Description
**The WinRM service must not allow unencrypted traffic.**

Allowing unencrypted traffic on the WinRM service exposes administrative commands and data to interception. Attackers performing Man-in-the-Middle (MITM) attacks can sniff this traffic to gain insight into the environment or inject malicious commands into the management session.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
This remediation utilizes the Group Policy Registry path to enforce the encryption requirement strictly at the policy level.

1.  **Registry Targeting:** The script targets the policy key: `HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service`.
2.  **Value Configuration:** It identifies or creates the DWORD value named `AllowUnencryptedTraffic`.
3.  **Enforcement:** The script sets this value to `0`. This explicitly configures the Windows Remote Management service to reject any connection attempts that do not utilize transport layer encryption (HTTPS).


---

## 📊 Rescan Verification Report

<img width="1918" height="872" alt="image" src="https://github.com/user-attachments/assets/d79bb7f9-462c-407c-8246-db178713f540" />

---

