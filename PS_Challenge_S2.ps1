# List Commands in the MAnagemnet Module - PowerShell 7
# List Running Services 
Get-Service | Where-Object {$_.Status -eq "Running"} 

# PRovided a detailed list of NAme, Status, StartType, File Location

Get-Service | Select-Object  -Property Name,Status,StartType,BinaryPathName