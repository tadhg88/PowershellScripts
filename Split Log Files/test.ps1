Write-Host "Start script"

# set path to file to split
$FileLocation = -join ($PSScriptRoot, "\LogfileToSplit.csv")
Write-Host $FileLocation

# Read parent CSV
$InputFilename = Get-Content $FileLocation

$Filename = -join ($PSScriptRoot, "\", "test_output.csv")
$InputFilename[0..10] | Out-File $Filename -Force

Write-Host "Processing complete......"