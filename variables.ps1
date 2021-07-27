# Powershell Demo Script: Variables in PowerShell
#
# Prof. Frank Emanuel
# CST8202 Windows Desktop Support (S21)

Write-Output "I am making my first variable."
$myVariable = 14
Write-Output $myVariable

Pause

Write-Output "Variables can be made to hold any object like a string."
$myVariable = "This is a string."
Write-Output "I have replaced the first assigned value with this: $myVariable"

Write-Output ""

Write-Output "I can even put complex objects into variables like the contents of a directory listing"
$myOtherVariable = Get-ChildItem ..\..

Write-Output $myOtherVariable

Write-Output ""

Pause

Write-Output "`n"

Write-Output 'At this point $myOtherVariable is a full object because Get-ChildItem returns an object:'
Write-Output "`nThese are its members:"

$myOtherVariable | Get-Member | Select-Object -Property Name | Format-Table

Pause

Write-Output "In order to see the properties we used cmdlets piped together." 
Write-Output "This works because when we just type the name of a variable it will send the object to the output device."

Write-Output "`nWe can also format the output using cmdlets."

$myOutput = $myOtherVariable | Get-Location | Format-Table -HideTableHeaders | Get-Unique | Out-String

$myOutput = $myOutput.replace("`n", "")
$myOutput = $myOutput.replace("`r", "")

Write-Output "$myOutput contains:"

$myOtherVariable | Select-Object -Property name | Format-Table

Pause

Write-Output "The next script will explore arrays."


