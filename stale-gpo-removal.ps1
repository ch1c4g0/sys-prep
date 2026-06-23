#Use these commands to resolve a computer that was removed from an active directory domain.
    #Specifically stale update GPO's that block you from installing updates on your own.

# Backup the Windows Update policy keys first
reg export "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" "$env:TEMP\WindowsUpdatePolicyBackup.reg" /y
reg export "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" "$env:TEMP\WindowsUpdateAUPolicyBackup.reg" /y

# Remove stale policy keys
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /f

# Refresh policy and restart update services
gpupdate /force
net stop wuauserv
net stop bits
net stop usosvc
net stop dosvc

net start bits
net start wuauserv
net start usosvc
net start dosvc
