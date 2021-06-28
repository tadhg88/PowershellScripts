Write-Host "Start script"

# set path to file to split
$FileLocation = -join ($PSScriptRoot, "\LogfileToSplit.csv")
Write-Host $FileLocation

# Read parent CSV
$InputFilename = Get-Content $FileLocation
$OutputFilenamePattern = 'output_split_'
$LineLimitPerFile = 40000

# Initialize
$masterFileLineNum = 0
$outputFileLine = 0
$outputFileNum = 0
$start = 0

# Loop all text lines
while ($masterFileLineNum -le $InputFilename.Length) {

    # Generate child CSVs
    if ($outputFileLine -eq $LineLimitPerFile -Or $masterFileLineNum -eq $InputFilename.Length) {
        $outputFileNum++
        $Filename = -join ($PSScriptRoot, "\", "$OutputFilenamePattern$outputFileNum.csv")
        $InputFilename[$start..($masterFileLineNum - 1)] | Out-File $Filename -Force
        
        $start = $masterFileLineNum;
        $outputFileLine = 0
        Write-Host "$Filename"
    }

    # Increment counters
    $outputFileLine++;
    $masterFileLineNum++
}

Write-Host "Processing complete......"