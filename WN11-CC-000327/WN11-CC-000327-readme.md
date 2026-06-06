# STIG ID: WN11-CC-000327

## 🛡️ Vulnerability Description
**PowerShell Transcription must be enabled.**

While logging captures individual commands, Transcription creates a comprehensive text-based record of the entire PowerShell session, including input and output. Failure to enable this creates a gap in forensic analysis, making it difficult to reconstruct an attacker's actions during an intrusion.

---

## ⚙️ Remediation Strategy

**PowerShell Implementation Logic:**
The automation script modifies the Registry to turn on system-wide transcription and define a secure storage location.

1.  **Registry Configuration:** The script targets `HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription`.
2.  **Activation:** It sets the `EnableTranscripting` DWORD value to `1`.
3.  **Output Definition (Optional but Recommended):** The script may also configure the `OutputDirectory` string to ensure logs are saved to a hardened, monitored directory rather than the user's default documents folder.


---

## 📊 Rescan Verification Report

<img width="1918" height="868" alt="image" src="https://github.com/user-attachments/assets/8ef8aec8-7b33-4b50-bb84-935ddbef0f9b" />

---

