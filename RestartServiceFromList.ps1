Set-ExecutionPolicy -ExecutionPolicy Bypass -Force

$workstation = Get-Content -Path C:\RebootShutdownList.txt


$computer = Get-Service -DisplayName ServiceName-ComputerName $workstation

Restart-Service -DisplayName ServiceName- -Force


function FuncCheckService{param($ServiceName)

 $arrService = Get-Service -Name $ServiceName
 if ($arrService.Status -ne "Running")
 {
 Start-Service $ServiceName
 Write-Host "Starting " $ServiceName " service" 
 " ---------------------- " 
 " Service is now started"
 }
 if ($arrService.Status -eq "running")
 { 
 Start-Service $ServiceName
 Write-Host "$ServiceName service is already started"
 }
 }