# Automated DISA STIG Remediation & Compliance Auditing for Windows 11

## 🛠 Environment & Tech Stack

- **Cloud Infrastructure:** Azure VM (Windows 11 Pro)
- **Vulnerability Management:** Tenable.io / Nessus
- **Automation:** PowerShell 7+ (for STIG remediation)
- **Compliance Standard:** DISA STIG Windows 11 (Version 2, Release 4)

---

## 📖 Project Overview

### What is DISA STIG?
The **Security Technical Implementation Guides (STIGs)**, published by the Defense Information Systems Agency (DISA), represent the configuration standards for United States Department of Defense (DoD) Information Assurance (IA) and IA-enabled devices/systems.

### Why is it Important?
Adhering to STIGs is crucial for hardening systems against cyber threats. These guidelines provide technical specifications to secure software and operating systems, thereby minimizing the attack surface.

### Impact of Non-Compliance
- **Security Risks:** Systems are left vulnerable to known exploits, credential dumping, and lateral movement attacks.
- **Audit Failures:** Organizations may fail compliance audits (such as CMMC, NIST, or FISMA), leading to a loss of Authority to Operate (ATO).
- **Operational Consequences:** Non-compliance can result in severe financial penalties, loss of government contracts, and reputational damage.

---

## 🚀 Workflow: Scanning & Remediation

The following procedure outlines the lifecycle of creating the environment, establishing a compliance baseline, and automating the remediation of vulnerabilities.

### Phase 1: Infrastructure Setup & Configuration
1. **Deploy VM:** Log in to the [Azure Portal](https://portal.azure.com) and provision a new Windows 11 Pro Virtual Machine.
2. **Network Configuration:** *Temporarily* disable the Windows Firewall on the target VM to facilitate the initial authenticated scan (ensure Network Security Groups allow traffic from the scanner).

### Phase 2: Vulnerability Scanning (Tenable)
1. Log in to [Tenable.io](https://cloud.tenable.com).
2. Navigate to **Scans** > **Create a New Scan** > **Advanced Network Scan**.
3. **Configure the Scan:**
   - **Scanner:** Select `LOCAL-SCAN-ENGINE-01` (or relevant scanner).
   - **Target:** Input the Private IP address of the Azure VM.
   - **Credentials:** Under the *Credentials* tab, select "Windows" and provide administrative credentials for an authenticated scan.
4. **Configure Compliance:**
   - Navigate to the *Compliance* tab.
   - Search for and select: **DISA Windows 11 STIG v2r4**.
5. **Optimization (Optional):** To isolate the scan strictly for STIG compliance (faster execution):
   - Disable all other plugins.
   - Select **Policy Compliance**.
   - Enable only **Windows Compliance Checks**.
6. **Execution:** Launch the scan to establish the initial baseline.

### Phase 3: Analysis & Remediation
1. **Review:** Analyze the baseline scan results and identify high-severity failures.
2. **Scripting:** Develop/Run the PowerShell automation script to apply fixes for the selected STIG IDs.
3. **Verification:** Re-run the Tenable scan to confirm the successful application of the security controls.

---

## 📊 Baseline Scan Results

<img width="2854" height="1404" alt="Screenshot 2025-11-23 095312" src="https://github.com/user-attachments/assets/8f9a8bd9-dd87-47fe-8f17-75d2043615f9" />

---

## 🛡️ Targeted STIGs for Remediation

The following STIGs were identified as critical failures and selected for automated remediation via PowerShell.

| STIG ID | Title | Severity | Security Context & Justification |
| :--- | :--- | :--- | :--- |
| [**WN11-CC-000038**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000038/WN11-CC-000038-readme.md) | WDigest Authentication must be disabled | High | Prevents plaintext credentials from being stored in LSASS, directly mitigating credential dumping risks (e.g., Mimikatz). |
| [**WN11-CC-000326**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000326/WN11-CC-000326-readme.md) | PowerShell Script Block Logging must be enabled | High | Provides visibility into malicious PowerShell activity; essential for detecting "living-off-the-land" techniques. |
| [**WN11-CC-000327**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000327/WN11-CC-000327-readme.md) | PowerShell Transcription must be enabled | High | Creates full transcripts of PowerShell sessions, enhancing forensic capabilities during incident response. |
| [**WN11-CC-000345**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000345/WN11-CC-000345-readme.md) | WinRM service must not use Basic authentication | High | Prevents credential theft by disallowing weak, unencrypted authentication mechanisms used in lateral movement. |
| [**WN11-CC-000350**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000350/WN11-CC-000350-readme.md) | WinRM service must not allow unencrypted traffic | High | Blocks attackers from intercepting or tampering with WinRM remote management sessions. |
| [**WN11-SO-000120**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-SO-000120/WN11-SO-000120-readme.md) | SMB server must always perform SMB packet signing | High | Prevents relay attacks and tampering with SMB traffic. |
| [**WN11-SO-000100**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-SO-000100/WN11-SO-000100-readme.md) | SMB client must always perform SMB packet signing | High | Hardens both sides of SMB communication, reducing spoofing and MITM attack risks. |
| [**WN11-CC-000270**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000270/WN11-CC-000270-readme.md) | RDP client must not save passwords | Medium | Stops attackers from harvesting stored RDP credentials after breaching a machine. |
| [**WN11-CC-000280**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000280/WN11-CC-000280-readme.md) | RDP must always prompt for password | Medium | Ensures credentials must always be entered manually, preventing auto-use by malware. |
| [**WN11-CC-000310**](https://github.com/Aaniket09/STIGS-Implementation-Automation/blob/main/WN11-CC-000310/WN11-CC-000310-readme.md) | Users must be prevented from changing installation options | Medium | Blocks users/malware from modifying installation settings to bypass security controls. |
