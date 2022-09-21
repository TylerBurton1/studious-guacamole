# PS Challendge Step 4 - Fidn today's files. Confirm files were created. 
#Look for files older thatn 6 hours in the print spooler, if older than 6 hrs restart Spooler

# There should be 2 files per day in this scenario. ( 1 HTML and 1 JSON)
$RunningServicesFiles = Get-CHildItem -Path (C:\temp\RunningServicesData) 
If ($RunningServicesFiles.Count -ge 2) {
    Write-Host "SUCCESS: Files Created"  -ForegroundColor "Green"
} else  {
    Write-Error "ERROR: Files are Misssing"  -ForegroundColor "DarkRed"
}


#Spooler check and restart

Get-ChildItem -Path "$env:systemroot\System32\Spool\Printers" -file | foreach {$creationTime = $_.creationTime;
$now = get-date;
if(($now - $creationTime).addhours(-6))
{
    Write-Host "File less that 6 hours old."
}
else {
    Restart-Service -Name Spooler
    Write-host "Print Spooler Restarting."  -ForegroundColor "DarkRed"
}
}