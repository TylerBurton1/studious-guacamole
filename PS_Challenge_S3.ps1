#PS Challenege Step 3- enable files to be stored and acces for 30 days.  Export to HTML and Details to JSON

# Files export location, change file path for sepcific system EX: C\:temp\RunnningServicesData
New-Item -Path "C:\" -Name "RunningServicesData" -ItemType Directory
#Hint: Build on to step 2

# Variables for HTML Page and Get-Date
$htmlParams = @{Title = "RunningServices"; Body = Get-Date;PostContent = "For details conatact IT"}
$b = get-date -format "MMddyy"

#HTML Export
Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object Name,Status,StartType,BinaryPathName |
 ConvertTo-Html $htmlParams| Out-File ($b +"svc.htm")

 #JSON Export

 Get-Service | Where-Object { $_.Status -eq 'Running' } | ConvertTo-JSON |
    Out-File ($b + "svc.json")


    
