# Powershell Demo Script: cmdlets in PowerShell
#
# Prof. Frank Emanuel
# CST8202 Windows Desktop Support (S21)
#
# Attention, run this script as administrator.


Write-Output "cmdlets are at the heart of PowerShell. Each cmdlet is a"
Write-Output "program that digs deep into the structure of Windows."
Write-Output "Most cmdlets return an object, a robust packet of data and"
Write-Output "methods (functions) that work on that data, when they are run."
Write-Output "This makes it easy to pipe one cmdlet's results into another"
Write-Output "cmdlet's input.`n"

Write-Output "Most cmdlets follow a verb-noun sytax. You can type Get-Verb to"
Write-Output "list the available verbs. The nouns indicate on what the verb is done.`n"

Write-Output "Let's list the commands by verb, this will not list any commands that do"
Write-Output "not use offical verbs.`n"

Pause

$verbs = Get-Verb | Sort-Object -Property verb | Select-Object -ExpandProperty verb 

$outputFormat = 0

# foreach ($verb in $verbs) {
    
#     $commands = Get-Command -name $verb* -type cmdlet 

#     if ($commands){
    
#         Write-Output "The cmdlets for the verb $verb include:"
#         $commands | Format-Table -HideTableHeaders -Property name 

#         if ( $outputFormat++ -ge 3 ){

#             Pause
#             $outputFormat = 0
    
#         }

#     }
   
# }

Write-Output "`nThat is a lot of commands. These are only the cmdlets that use authorized"
Write-Output "nouns.`n"
Write-Output "Because cmdlets, like Get-Verb and Get-Command return objects we use commands"
Write-Output "and cmdlets to format their order and display.`n"
Write-Output "We can also use PowerShell to interface with Windows in a similar way. To"
Write-Output "demonstrate give me a user login name."

do{

    $userName = Read-Host -Prompt "Enter the proposed username"
    $suspectedUser = Get-LocalUser -Name $userName -ErrorAction silentlycontinue

    if ($suspectedUser){

        Write-Host -ForegroundColor Red "Sorry, $userName is already taken. Try again please."
        $userName = "none"

    }

} while ($userName -eq "none")

do{

    $password = Read-Host -Prompt "Enter a password for $username" -AsSecureString 
    $passcheck = Read-Host -Prompt "Confirm that password" -AsSecureString

    if (!(ConvertFrom-SecureString $password).CompareTo((ConvertFrom-SecureString $passcheck))){ 
        
        Write-Host -ForegroundColor Red "Passwords do not match, try again please."
        $password = "none" 
    
    }

} until ($password -ne "none")

New-LocalUser -Name $userName -Password $password -Description "Test add of user."

Get-LocalUser

Write-Output "`nHopefully you see you new user in the list."

Pause

Write-Output "`nRemoving the new user...`n"

Remove-LocalUser -Name $userName

Get-LocalUser

Write-Output "`nAnd hopefully they are gone now. This script required administrative rights to run."
Write-Output "Happy Coding!"



