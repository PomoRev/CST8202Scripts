# Powershell Demo Script: Conditional Branching in PowerShell
#
# Prof. Frank Emanuel
# CST8202 Windows Desktop Support (S21)

Write-Output "Conditional branching is predicated on boolean logic."
Write-Output "Boolean expressions evaluate to either true or false."
Write-Output "`nWe can simply use the constants true and false:"

# basic if statement

if ($true){

    Write-Output "The expression is true."

}

Write-Output "`nThe above command only executes if the boolean expression evalutates to true($true)."

Pause

Write-Output "`nWe can add an else statement to the conditional to give an option if the last if"
Write-Output "evaluted to false:"

if ($false){

    Write-Output "The expression is false($false)."

} else {

    Write-Output "The expression is true."

}

Write-Output "`nOne of the above code blocks will execute."

Pause

Write-Output "`nWe can check for a range of options using nested if-elseif-else statements.`n"

$myVariable = 12

if ($myVariable -eq 14){

    Write-Output "myVariable is equal to 14"

} elseif ($myVariable -gt 14) {

    Write-Output "myVariable is greater than to 14"

} elseif (($myVariable -lt 14) -and ($myVariable -ne 12)){

    Write-Output "myVariable is both smaller than 14 and not equal to 12"

} else {

    Write-Output "myVariable is equal to 12($myVariable)"

}

Write-Output "`nThe above conditional branching construct will evaluate $myVariable"
Write-Output "The trick with building a good conditional statement is to ask what do I"
Write-Output "already know from the previous tests. This will simplify your bounds checking"
Write-Output "which leads to cleaner code. Clean code is easier to debug!`n"

Pause

Write-Output "`nOur conditional statements can be complex, but they do not use C-style"
Write-Output "logical or conditional operators (<,>,==,!=,<=, or >=) instead they use the"
Write-Output "Posix compliant BASH shell operators (-lt,-gt,-eq,-ne,-le, or -ge). In addition"
Write-Output "PowerShell uses -and, -or, -xor, and -not as logical operators. Although you can"
Write-Output "also use the bang (!) operator instead of -not.`n"

Pause

Write-Output "`nThere is one other conditional construct that is helpful when I want to test"
Write-Output "equality against a range of simple values - the switch (aka case) statement."
Write-Output "The switch construct behaves just a bit differently than the case in other languages."
Write-Output "Let's look at an example.`n"

$myVariable = Read-Host -Prompt "Enter your favourite colour: "

# The system supports these colours: Black, DarkBlue, DarkGreen, DarkCyan, DarkRed, DarkMagenta, 
# DarkYellow, Gray, DarkGray, Blue, Green, Cyan, Red, Magenta, Yellow, and White

switch ($myVariable.ToLower()) {

    "purple" { $myVariable = "darkmagenta" }
    "magenta" {}
    "blue" {}
    "black" {}
    "walnut" { $myVariable = "darkyellow"; break } # the break is appropriate in a switch!
    "darkblue" {}
    "darkgreen" {}
    "darkcyan" {}
    "darkred" {}
    "bloodred" { $myVariable = "darkred" }
    "darkmagenta" {}
    "darkyellow" {}
    "gray" {}
    "grey" { $myVariable = "gray" }
    "darkgray" {}
    "green" {}
    "cyan" {}
    "red" {}
    "yellow" {}
    "walnut" { $myVariable = "gray" }

    Default { 
        
        Write-Output "I did not find your colour choice in my pallette, sorry.`n"
        $myVariable = "white"
    
    }
}

Write-Output "`nThen you will like this!"
Write-Host -ForegroundColor $myVariable "The quick brown fox jumped over the slow red turtle."

Write-Output "`n"

Pause

Write-Output "`nConditional constructs control the flow through a program. They are your friends."







