# PS Challenge Step 5: Set Paramaters Export Services
Param(
    [String]$RunningServices='C:\temp\RunningServicesData',
    # $b = get-date referenced form step 3 of the challenge
    [String]$b=((get-date=tostring("MMddyy"))
))
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name,Status,StartType,BinaryPathName |
 ConvertTo-Html | Out-File ($b +"svc.htm",$RunningServices)

 #JSON Export

 Get-Service | Where-Object { $_.Status -eq 'Running' } | ConvertTo-JSON |
    Out-File ($b + "svc.json",$RunningServices) 


$RunningServicesFiles = Get-CHildItem -Path (C:\temp\RunningServicesData) 
If ($RunningServicesFiles.Count -ge 2) {
    Write-Host "SUCCESS: Files Created"  -ForegroundColor "Green"
} else  {
    Write-Error "ERROR: Files are Misssing"  -ForegroundColor "DarkRed"
}