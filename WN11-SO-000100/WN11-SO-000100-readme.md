# STIG ID: WN11-SO-000100

## 🛡️ Vulnerability Description
**The SMB client must always perform SMB packet signing.**

Similar to the server-side requirement, the client (the Windows 11 machine itself) must verify the authenticity of the servers it connects to. If disabled, the client can be tricked into connecting to a rogue SMB server set up by an attacker, leading to credential theft or the delivery of malicious payloads.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
The script modifies the "LanmanWorkstation" (Workstation service) parameters in the registry.

1.  **Registry Targeting:** The script navigates to `HKLM\System\CurrentControlSet\Services\LanmanWorkstation\Parameters`.
2.  **Signature Enforcement:** It identifies the `RequireSecuritySignature` value.
3.  **Value Update:** The script sets this DWORD to `1`. This prevents the Windows 11 client from establishing connections to file shares that do not support packet signing.


---

## 📊 Rescan Verification Report

<img width="1918" height="872" alt="image" src="https://github.com/user-attachments/assets/79717a05-f073-48f6-9db4-456b4f74e8e3" />

---
