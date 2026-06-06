# Define the Registry path and value details
# This path corresponds to the Group Policy setting for Script Block Logging
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$regName = "EnableScriptBlockLogging"
$desiredValue = 1

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
Write-Host "Starting Remediation for STIG ID: WN11-CC-000326" -ForegroundColor Cyan
Write-Host "Goal: Enable PowerShell Script Block Logging (Visibility into attacks)" -ForegroundColor Gray
Write-Host "------------------------------------------------------------" -ForegroundColor Cyan

try {
    # 1. Check if the registry key path exists, create if it doesn't
    # We use -Force to ensure the entire directory structure is created if parents are missing
    if (-not (Test-Path $regPath)) {
        Write-Host "[INFO] Registry path not found. Creating path: $regPath" -ForegroundColor Yellow
        New-Item -Path $regPath -Force | Out-Null
    }

    # 2. Check current value to avoid unnecessary writes
    $currentValue = (Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName

    if ($currentValue -eq $desiredValue) {
        Write-Host "[OK] System is already compliant. '$regName' is set to $desiredValue." -ForegroundColor Green
    }
    else {
        # 3. Apply the fix
        Write-Host "[INFO] Remediating... Setting '$regName' to $desiredValue." -ForegroundColor Yellow
        Set-ItemProperty -Path $regPath -Name $regName -Value $desiredValue -Type DWord -ErrorAction Stop
        
        # 4. Verify the fix
        $newValue = (Get-ItemProperty -Path $regPath -Name $regName).$regName
        if ($newValue -eq $desiredValue) {
            Write-Host "[SUCCESS] Remediation applied successfully. Logging is now active." -ForegroundColor Green
        } else {
            Write-Host "[ERROR] Failed to verify the registry change." -ForegroundColor Red
        }
    }
}
catch {
    Write-Host "[ERROR] An unexpected error occurred: $_" -ForegroundColor Red
}

Write-Host "------------------------------------------------------------" -ForegroundColor Cyan
