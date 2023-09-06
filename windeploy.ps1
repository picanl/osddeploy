Write-Host  -ForegroundColor Cyan "Starting Carmel Intune Deployment ..."
Start-Sleep -Seconds 5
iex (irm functions.osdcloud.com)
#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}
# Define a function to display the menu
function Show-Menu {
    Clear-Host
    Write-Host "==================== Menu ===================="
    Write-Host "1. Carmel Windows 10 64bit Education (laatste Versie)"
    Write-Host "2. Carmel Windows 11 64bit Education (laatste Versie)"
    Write-Host "3. Reboot"
    Write-Host "4. Exit"
    Write-Host "=============================================="
}

# Main menu loop
do {
    Show-Menu

    # Prompt for user input
    $choice = Read-Host "Select an option (1-4)"

    # Use a switch statement to perform actions based on user choice
    switch ($choice) {
        "1" {
            # Add code for Option 1 here
            Write-Host "You selected Option 1"
            Start-OSDCloud -OSLanguage nl-nl -OSName 'Windows 10 22H2 x64' -OSEdition Education -ZTI
        }
        "2" {
            # Add code for Option 2 here
            Write-Host "You selected Option 2"
            Start-OSDCloud -OSLanguage nl-nl -OSName 'Windows 11 22H2 x64' -OSEdition Education -ZTI
        }
        "3" {
            # Add code for Option 3 here
            Write-Host "You selected Option 3"
            wpeutil reboot
        }
        "4" {
            Write-Host "Exiting..."
            wpeutil reboot
            break # Exit the loop and the script
        }
        default {
            Write-Host "Invalid choice. Please select a valid option (1-4)."
        }
    }
} while ($true)

#Anything I want  can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
RemoveAppx bing,xbox,phone

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
