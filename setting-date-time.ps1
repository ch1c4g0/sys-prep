
#Check to see the current date to confirm sync,

Get-Date

#Check time zone,

Get-TimeZone

#Set TimeZone -Id "Central Standard Time"

#Check available time zones,

Get-TimeZone -ListAvailable


#Starting / Restarting time service,

Start-Service w32time

w32tm /resync

#If the device fails to register,

w32tm /unregister

w32tm /register

Start-Service w32time

w32tm /resync
