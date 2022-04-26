# Purpose : Deletes files in received path 
#         : that are older than the specified number of days.

# Number Days of log files to keep.
$LogsRetention = 5

$pathReceived = Read-Host "Please enter path"

# Make days negative.
$LogsRetention = $LogsRetention * -1

# get list of files to delete
$Logs = (Get-ChildItem $pathReceived -File -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays($LogsRetention) })
Write-Output $Logs

# get delete confirmation
$deleteFiles = Read-Host "Would you like to delete the files y/n"

if ($deleteFiles = "y")
{
    # delete files
    $Logs | Remove-Item
    Write-Output ("*** Files deleted ***")
}
