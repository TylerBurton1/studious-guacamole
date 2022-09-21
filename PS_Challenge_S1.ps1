# PowerShell Cahllenge step 1 Lsit commands in the Management Module, give a count of services, and restart the print sppoler.

Get-Command -Module Microsoft.PowerShell.Management

# Count Services
(Get-Service | Measure-Object).Count

#Restart Spooler

Restart-Service -Name Spooler
