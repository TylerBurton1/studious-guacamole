#PS Challenge Step 5 Part 2: Print Spooler

param(
    [int]$hours=6
)
Get-ChildItem -Path "$env:systemroot\System32\Spool\Printers" -file | foreach {$creationTime = $_.creationTime;
    $now = get-date;
    if(($now - $creationTime).addhours(-hours))
    {
        Write-Host "File less that 6 hours old."
    }
    else {
        Restart-Service -Name Spooler
        Write-host "Print Spooler Restarting."  -ForegroundColor "DarkRed"
    }
    }