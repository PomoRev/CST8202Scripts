# Powershell Demo Script: Loops in PowerShell
#
# Prof. Frank Emanuel
# CST8202 Windows Desktop Support (S21)

Write-Output "We like to keep you in the loop here in CST8202!"
Write-Output "`nLoops are constructs that allow us to repeat blocks of code to"
Write-Output "avoid repitition in our code. Loops will shorten our code and allow"
Write-Output "us to process lots of commands in a short amount of time. Want to"
Write-Output "view the logs on 20 different productions servers? loops are our friends.`n"

$loopChoice = $false

do {

    Write-Output "Enter the number of the loop type you would like to explore:"
    Write-Output "1 - while loops"
    Write-Output "2 - do loops (while and until)"
    Write-Output "3 - for loops"
    Write-Output "4 - foreach loops"
    Write-Output "0 - end script"

    $loopChoice = Read-Host -Prompt "Which type of loop would you like to see?"

    if ($loopChoice -eq "1"){

        Write-Output "`nExcellent! The while loop is the most basic of loops."
        Write-Output "We use a while loop when we do not know if we even want to go"
        Write-Output "through the loop once. The while is a simple construct."
        Write-Host -NoNewline "`nA simple counter: "

        $counter = 0;
        
        while( $counter++ -lt 10){

            Write-Host -NoNewline "$counter "

        }

        Write-Host "Done!"
        Write-Output "`nYou have just experiences a while loop in action! `n"

        Pause

    } elseif ($loopChoice -eq "2") {

        Write-Output "`nGreat! You are actually in a simple do loop right now."
        Write-Output "do loops are used when we know we want to run through the loop at least once"
        Write-Output "but I am not sure how many times I want to iterate through it.`n"

        Write-Host -NoNewline "Starting now: "

        $counter=0

        do{

            Write-Host -NoNewline "$counter "
            $counter++

        } while ($counter -le 4)

        Write-Host "all done."

        Write-Output "`nYou have just experiences a do while loop in action! But there is more.`n"

        Pause

        Write-Output "Instead of a while test we can also use an until test with a do loop."
        Write-Output "Consider this looping action.`n"

        $counter=0

        do{

            Write-Host -NoNewline "$counter "
            $counter++

        } until ($counter -le 4)

        Write-Host "all done."

        Write-Output "`nYou have just experienced all the do loop has to offer.`n"

        Pause

    } elseif ($loopChoice -eq "3"){

        Write-Output "`nThe venerable for loop is reserved for those times when we know"
        Write-Output "how many iterations we would like to make. The for loop follows C conventions."
        Write-Output "It has three parts all separated by semi-colons:"
        Write-Output "1. The initialization where you set the starting value of one or more variables"
        Write-Output "   to act as a counter for your loop."
        Write-Output "2. A test condition that will evalutate to true or false and executes before" 
        Write-Output "   every iteration."
        Write-Output "3. And the repeat which contains one or more commands (pre-fix and post-fix are usual)"
        Write-Output "   The repeat advances the counter towards the test condition and the end of the loop.`n"

        Write-Host -NoNewline "Starting now: "

        for ($counter = 0; $counter -le 4; $counter++){

            Write-Host -NoNewline "$counter "

        }

        Write-Host "all done."

        Write-Output "`nIs not the for loop majestic? There is more.`n"

        Pause

        Write-Output "`nOften we will use nested for loops to execute an entire loop many times.`n"

        for ($i = 0; $i -lt 12; $i++){

            for ($j = 0; $j -lt 12; $j++){

                if (($j -eq 0) -or ($j -eq 11)){

                    Write-Output "  ************"

                }else {
                    
                    Write-Output "  *          *"

                }
            }
        }

        Write-Output "`nWe can likely imagine uses that go well beyond simply making fancy boxes."
        Write-Output "For example we may want to add a list of users each to the same list of groups."
        Write-Output "Which will use for loops, but is better implemented with foreach loops.`n"

        Pause


    } elseif ($loopChoice -eq "4"){

        Write-Output "`nThe for loop is a powerful tool, but PowerShell has made life a bit easier for"
        Write-Output "us by giving us a specialized looping construct that works with complex objects"
        Write-Output "like arrays and tables.`n"

        Write-Output "We can loop through a userlist, for example, and assign various rights to them."
        Write-Output "I will demonstrate the principle by merging a couple of arrays.`n"

        $userNames = @("Peter", "Paul", "Mary", "George")
        $colours = @( "blue", "red", "yellow", "green")

        foreach ($uName in $userNames){

            foreach ($colour in $colours){
            
                Write-Host -NoNewline -ForegroundColor $colour "$uName "
            
            }

            Write-Host "`b."

        }

        Write-Output "`nEnjoy the colourful example!`n"

        Pause

    } else {

        Write-Output "`nNot sure I understood that response, try again."

    }

} while ($loopChoice -ne "0")