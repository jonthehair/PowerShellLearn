Get-WmiObject win32_logicalDisk | Select-Object DeviceID, @{Name="FreeSpace";Expression={"{0:N2}" -f ($_.FreeSpace/1GB)}} 



