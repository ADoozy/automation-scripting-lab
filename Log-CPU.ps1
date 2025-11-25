$logPath = "C:\Logs"
$logFile = "$logPath\CPU_Usage.txt"

# Create directory if it doesn't exist
if (!(Test-Path $logPath)) {
    New-Item -ItemType Directory -Path $logPath | Out-Null
}

Write-Host "Logging CPU usage every 5 seconds... Press CTRL + C to stop."

while ($true) {
    $cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    "$timestamp - CPU Usage: $cpu%" | Out-File -FilePath $logFile -Append
    Start-Sleep -Seconds 5
}
