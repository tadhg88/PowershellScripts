# Purpose : Deletes all files under C:\Logs and 
#         : C:\logs folder than the specified number of days.

# Days to keep c:\logs files.
$LogsRetention = 30

# Make the retention times negative.
$LogsRetention = $LogsRetention * -1

# Delete the old Logs files.
#$Logs = (Get-ChildItem C:\Logs -File -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays($LogsRetention) })
#$Logs | Remove-Item

$Logs = (Get-ChildItem C:\Logs -File -Recurse | Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays($LogsRetention) })
#Write-Output $Logs

Write-Output "test output"

# foreach ($server in $Logs) {
#     Write-Output ("--- Searching on Server: $server at: ")
# }

$Logs | Select-Object | Write-Output

#$Logs | Remove-Item
