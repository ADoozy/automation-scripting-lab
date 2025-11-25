# Ping-List.ps1

$inputFile = "C:\computers.txt"
$outputFile = "C:\ping_results.txt"

Get-Content $inputFile | ForEach-Object {
    $computer = $_

    if (Test-Connection -ComputerName $computer -Count 1 -Quiet) {
        Add-Content $outputFile "$computer - ONLINE"
    } else {
        Add-Content $outputFile "$computer - OFFLINE"
    }
}

Write-Host "Ping test completed. Results saved to $outputFile"
