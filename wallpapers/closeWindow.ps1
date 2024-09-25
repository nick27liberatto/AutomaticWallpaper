# Get all open windows, excluding critical system processes
$openWindows = @(Get-Process | Where-Object { 
    $_.MainWindowHandle -ne 0 -and 
    $_.ProcessName -notin @('explorer', 'taskmgr', 'ShellExperienceHost', 'StartMenuExperienceHost', 'LockApp')
})

# Check if there are any open windows
if ($openWindows.Count -eq 0) {
    Write-Host "No open windows found. Exiting script."
    return
}

# Loop through each window and close it
foreach ($window in $openWindows) {
    try {
        $window.CloseMainWindow()
        $window | Out-Null
    } catch {
        Write-Host "Failed to close window: $($_.Exception.Message)"
    }
}
