function Get-CorpUsage
{
#Set variables
$cpuinterval=5;
$cpucount=4;
$datamemint=5;
$datamemcount=4

$cpudata = Get-Counter -Counter "\processor(_total)\% processor time" -SampleInterval $cpuinterval -MaxSamples $cpucount
$total=0;

for($i=0;$i -lt $cpudata.length;$i++)
{
$total=$total+$cpudata[$i].CounterSamples.CookedValue
}
$total=$total/$cpudata.Length

$cpudatareturn= "CPUAverage={0:N2}%" -F $total

$datamem = Get-Counter -Counter "\\adams3\memory\% committed bytes in use" -SampleInterval $datamemint -MaxSamples $datamemcount

$total=0;

for($i=0;$i -lt $datamem.length;$i++)
{
$total=$total+$datamem[$i].CounterSamples.CookedValue
}
$total=$total/$datamem.Length

$memreturn="MemoryAverage={0:N2}%" -F $total

$cpudatareturn, $memreturn | Out-File -FilePath .\Desktop\test3.txt -Append
}

#Get-CorpUsage

$disks = Get-WmiObject win32_logicalDisk 

foreach($disk in $disks)
{
    Write-Host "Name = " $disk.DeviceID
    Write-Host "Free = " ("{0:N2}gb" -f ($disk.FreeSpace/1GB))
}



