$workstation = Get-Content -Path 'c:\temp\file.txt'

function FuncCheckService
{
param($ServiceName)

 
 foreach ($computer in $workstation)
   {
    $arrService = Get-Service -Name $ServiceName -ComputerName $computer -ErrorAction Ignore

    if ($arrService.Status -ne "Running")
     {
     #Start-Service $ServiceName
     #Write-Host $arrService.Name "Not Started  service" 
    $computer| Out-File C:\temp\NotStarted.txt -Append
     #Write-Host $_
     }
    elseif ($arrService.Status -eq "running")
     { 
     #Start-Service $ServiceName
     #Write-Host "$ServiceName service is already started"
     $computer | Out-File c:\temp\cupstarted.txt -Append
    #Write-Host  $arrService +  " running"
     }
       
   }


   
 }

 FuncCheckService -ServiceName 'snmp'

