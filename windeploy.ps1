Write-Host  -ForegroundColor Cyan "Starting Carmel Intune Deployment ..."
Start-Sleep -Seconds 5
iex (irm functions.osdcloud.com)
## load global variables
X:\OSDCloud\Config\Scripts\StartNet\isovars.ps1
#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1600x"
    Set-DisRes 1600
}
# Define a function to display the menu

# Display the menu
Clear-Host
Write-Host "==================== Carmel Intune Deployment Tool ======================="
Write-Host ""
Write-Host ""
Write-Host "==================== Menu ===================="
Write-Host "1. Carmel Windows 10 64bit Education (laatste Versie)"
Write-Host "2. Carmel Windows 11 64bit Education (laatste Versie)"
Write-Host "3. Reboot"
Write-Host "=============================================="

# Prompt for user input
$choice = Read-Host "Select an option (1-3)"

# Use a switch statement to perform actions based on user choice
switch ($choice) {
    "1" {
        # Add code for Option 1 here
        Write-Host "You selected Option 1"
        Write-Host "image url: $global:w10url"
        Start-OSDCloud -ImageFileUrl $w10url -OSLanguage nl-nl -OSName 'Windows 10 22H2 x64' -OSEdition Education -ZTI

        # Exit the script
        #exit
    }
    "2" {
        # Add code for Option 2 here
        Write-Host "You selected Option 2"
        Write-Host "image url: $global:w11url"
        Start-OSDCloud -ImageFileUrl $w11url -OSLanguage nl-nl -OSName 'Windows 11 22H2 x64' -OSEdition Education -ZTI

        # Exit the script
        #exit
    }
    "3" {
        # Add code for Option 3 here
        Write-Host "You selected Option 3"
        wpeutil reboot

        # Exit the script
        #exit
    }
    default {
        Write-Host "Invalid choice. Please select a valid option (1-4)."
    }
}





#Anything I want  can go right here and I can change it at any time since it is in the Cloud!!!!!
Write-Host  -ForegroundColor Cyan "Starting OSDCloud PostAction ..."
RemoveAppx bing,xbox,phone

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
#wpeutil reboot
