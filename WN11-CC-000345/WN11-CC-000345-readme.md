# STIG ID: WN11-CC-000345

## 🛡️ Vulnerability Description
**The WinRM service must not use Basic authentication.**

Basic authentication sends user credentials across the network in an easily reversible Base64 format. If an attacker intercepts this traffic, they can decode the credentials instantly. Disabling Basic authentication forces the use of stronger, encrypted protocols like Kerberos or Negotiate.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
This remediation utilizes the Group Policy Registry path to strictly enforce the setting at the policy level, which overrides local configuration.

1.  **Registry Targeting:** The script targets the specific policy key: `HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service`.
2.  **Value Configuration:** It identifies or creates the DWORD value named `AllowBasic`.
3.  **Enforcement:** The script sets this value to `0`. This explicitly configures the Windows Remote Management service to reject any authentication attempts using the insecure "Basic" scheme.


---

## 📊 Rescan Verification Report

<img width="1918" height="872" alt="image" src="https://github.com/user-attachments/assets/38a25924-35c6-4f04-b190-05ad439744c5" />

---
