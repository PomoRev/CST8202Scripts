# Powershell Demo Script: Arrays in PowerShell
#
# Prof. Frank Emanuel
# CST8202 Windows Desktop Support (S21)

Write-Output "Arrays are strongly typed!"
Write-Output "Let's make an array"

$myArray = 1, 3, 14, 7, 9, 12

Write-Output "$myArray`n"

Pause

Write-Output "When we type the array we can see this: "

$myArray.GetType() | Select-Object -Property BaseType | Format-Table -HideTableHeaders

Write-Output "This is a native system array is made up of integers"

Write-Output "Which means that we can only use integers in it.`n"

Pause

Write-Output "`nThese are all Integers:"

foreach ($myNumber in $myArray) {
    
    $myNumberType = $myNumber.GetType() | Select-Object -Property Name | Format-Table -HideTableHeaders | Out-String
    $myNumberType = $myNumberType.replace("`n", "")
    $myNumberType = $myNumberType.replace("`r", "") 

    Write-Output "$myNumber is an $myNumberType"

}

Write-Output "`n"

Pause

Write-Output "`nWe can address individual elements of an array by their index."
Write-Output "Indexs start at 0 and work as offsets on the strict type of the elements"
Write-Output "Which means that the name of the array is the starting address and element [3]"
Write-Output "is 3 $myNumberType lengths from the start, or the start of the fourth element.`n"

Write-Output "The fourth element in our array is:" 
$myArray[3]

Write-Output "`nCompare with the contents of the array: $myArray`n"

Pause

Write-Output "`nArrays are of fixed size, so adding an element means making a whole new array!"

if ($myArray.IsFixedSize) {
    Write-Output "It is true that I'm fixed!"
} else {
    Write-Output "Nope, I lied, this is not fixed."
} 

Write-Output "`nLet's add an element to our array."

$myArray += 34

Write-Output "It looks like the same array got bigger, but this is a whole new array: $myArray."
Write-Output "This might seem trivial, but it is always helpful to know how something works "
Write-Output "in order to choose the most efficient tool for the job - arrayLists are mutable.`n"

Pause

$myArray = $null

Write-Output "We can clear a variable by assigning it the value null."
Write-Output "myArray [$myArray] is empty now as you can see."

$myArray.Count

Write-Output "Yes, no elements, and this is also a new array.`n"

Pause

Write-Output "We can put objects into arrays, I'll grab all the process objects for Chrome."

$processArray = @(Get-Process chrome)

Write-Output "Let's list only up to 5 of these:"

$i = 0 # i is the traditional name for iterator

while (($i -lt 5) -and ($i -lt $processArray.Count)){

    $processArray[$i++] 

}

$i = $processArray.Count

Write-Output "`nNotice that the object is a table with headings and rows. "
Write-Output "There are actually $i processes started by Chrome currently!`n"

Pause

Write-Output "The syntax for PowerShell can be quite strange if you are familiar "
Write-Output "With any other language, including BASH or WinNT CMD."
Write-Output "However, there are some great resources online.`n"
Write-Output "Happy Scripting!`n"
