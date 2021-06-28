Write-Host "Start script"

Set-Location -Path C:\sandbox\Powershell

$CurrentLocation = Get-Location
$FileLocation = -join ($CurrentLocation, "\Log-2021-06-15.csv")
Write-Host $FileLocation

# Read parent CSV
$InputFilename = Get-Content $FileLocation
$OutputFilenamePattern = 'output_split_'
$LineLimit = 40000

# Initialize
$line = 0
$i = 0
$file = 0
$start = 0

# Loop all text lines
while ($line -le $InputFilename.Length) {

    # Generate child CSVs
    if ($i -eq $LineLimit -Or $line -eq $InputFilename.Length) {
        $file++
        $Filename = -join ($CurrentLocation, "\", "$OutputFilenamePattern$file.csv")
        $InputFilename[$start..($line - 1)] | Out-File $Filename -Force
        $start = $line;
        $i = 0
        Write-Host "$Filename"
    }

    # Increment counters
    $i++;
    $line++
}