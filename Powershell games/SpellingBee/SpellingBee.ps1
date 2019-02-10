##Created by Patrick Cartos
##2/9/2019
##e-mail - cartos8992@gmail.com
##github - https://github.com/CrimsonUSMC

$array = Get-Content "$env:USERPROFILE\Documents\powershell games\WordList\jr_k_words.txt"                    ##Words files that is used for the gam"

$count = $array.count
$count = $count - 1
$count = 0..($count - 1)
$global:text = $array[($count | get-random)]
$date = Get-Date -Format MMddyyHHMM
$file = $date + "SpellingBee"                                                  ##File that gets created to store the answers that your child got correct
Function Read-me{
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice("Microsoft Hazel Desktop")
    $speak.Rate = -3
    $speak.Volume = 100

    $speak.Speak($global:text)
    }

Function Read-Letters{

    if ($textbox.Text -eq $global:text){
    $global:text >> "$env:USERPROFILE\Documents\powershell games\SpellingBee\$file.txt"            ##outputs the words that your child got correct to this file
    $global:num++
    $global:text = $array[($count | get-random)]
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice("Microsoft Hazel Desktop")
    $speak.Rate = -3
    $speak.Volume = 100

    #$speak.Speak("Correct")

    $PlayWav=New-Object System.Media.SoundPlayer
    $PlayWav.SoundLocation="$env:USERPROFILE\Documents\powershell games\SpellingBee\cheer.wav"
    $PlayWav.PlaySync()
    $correct.text = "Correct: $global:num"
    $textbox.text = ""
    
    }
    else{
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice("Microsoft Hazel Desktop")
    $speak.Rate = 0
    $speak.Volume = 100

    $speak.Speak("Sorry, Try Again")
    }

}

Function Skip{
    
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice("Microsoft Hazel Desktop")
    
    $speak.Volume = 100

    $word = $text -split ("")
    foreach($w in $word){
    $speak.Rate = 0
    $speak.Speak($w)
    }
    $speak.Rate = -3
    $speak.Speak("The word is, $global:text")   
    
    }

Function Reader{
$global:num = 0
Add-Type -AssemblyName System.Windows.Forms

$Colors = @()
$Colors += "AliceBlue"
$Colors += "AntiqueWhite"
$Colors += "Aqua"
$Colors += "Aquamarine"
$Colors += "Azure"
$Colors += "Beige"
$Colors += "Bisque"
$Colors += "Black"
$Colors += "BlanchedAlmond"
$Colors += "Blue"
$Colors += "BlueViolet"
$Colors += "Brown"
$Colors += "BurlyWood"
$Colors += "CadetBlue"
$Colors += "Chartreuse"
$Colors += "Chocolate"
$Colors += "Coral"
$Colors += "CornflowerBlue"
$Colors += "Cornsilk"
$Colors += "Crimson"
$Colors += "Cyan"
$Colors += "DarkBlue"
$Colors += "DarkCyan"
$Colors += "DarkGoldenrod"
$Colors += "DarkGray"
$Colors += "DarkGreen"
$Colors += "DarkKhaki"
$Colors += "DarkMagenta"
$Colors += "DarkOliveGreen"
$Colors += "DarkOrange"
$Colors += "DarkOrchid"
$Colors += "DarkRed"
$Colors += "DarkSalmon"
$Colors += "DarkSeaGreen"
$Colors += "DarkSlateBlue"
$Colors += "DarkSlateGray"
$Colors += "DarkTurquoise"
$Colors += "DarkViolet"
$Colors += "DeepPink"
$Colors += "DeepSkyBlue"
$Colors += "DimGray"
$Colors += "DodgerBlue"
$Colors += "Firebrick"
$Colors += "FloralWhite"
$Colors += "ForestGreen"
$Colors += "Fuchsia"
$Colors += "Gainsboro"
$Colors += "GhostWhite"
$Colors += "Gold"
$Colors += "Goldenrod"
$Colors += "Gray"
$Colors += "Green"
$Colors += "GreenYellow"
$Colors += "Honeydew"
$Colors += "HotPink"
$Colors += "IndianRed"
$Colors += "Indigo"
$Colors += "Ivory"
$Colors += "Khaki"
$Colors += "Lavender"
$Colors += "LavenderBlush"
$Colors += "LawnGreen"
$Colors += "LemonChiffon"
$Colors += "LightBlue"
$Colors += "LightCoral"
$Colors += "LightCyan"
$Colors += "LightGoldenrodYellow"
$Colors += "LightGray"
$Colors += "LightGreen"
$Colors += "LightPink"
$Colors += "LightSalmon"
$Colors += "LightSeaGreen"
$Colors += "LightSkyBlue"
$Colors += "LightSlateGray"
$Colors += "LightSteelBlue"
$Colors += "LightYellow"
$Colors += "Lime"
$Colors += "LimeGreen"
$Colors += "Linen"
$Colors += "Magenta"
$Colors += "Maroon"
$Colors += "MediumAquamarine"
$Colors += "MediumBlue"
$Colors += "MediumOrchid"
$Colors += "MediumPurple"
$Colors += "MediumSeaGreen"
$Colors += "MediumSlateBlue"
$Colors += "MediumSpringGreen"
$Colors += "MediumTurquoise"
$Colors += "MediumVioletRed"
$Colors += "MidnightBlue"
$Colors += "MintCream"
$Colors += "MistyRose"
$Colors += "Moccasin"
$Colors += "NavajoWhite"
$Colors += "Navy"
$Colors += "OldLace"
$Colors += "Olive"
$Colors += "OliveDrab"
$Colors += "Orange"
$Colors += "OrangeRed"
$Colors += "Orchid"
$Colors += "PaleGoldenrod"
$Colors += "PaleGreen"
$Colors += "PaleTurquoise"
$Colors += "PaleVioletRed"
$Colors += "PapayaWhip"
$Colors += "PeachPuff"
$Colors += "Peru"
$Colors += "Pink"
$Colors += "Plum"
$Colors += "PowderBlue"
$Colors += "Purple"
$Colors += "Red"
$Colors += "RosyBrown"
$Colors += "RoyalBlue"
$Colors += "SaddleBrown"
$Colors += "Salmon"
$Colors += "SandyBrown"
$Colors += "SeaGreen"
$Colors += "SeaShell"
$Colors += "Sienna"
$Colors += "Silver"
$Colors += "SkyBlue"
$Colors += "SlateBlue"
$Colors += "SlateGray"
$Colors += "Snow"
$Colors += "SpringGreen"
$Colors += "SteelBlue"
$Colors += "Tan"
$Colors += "Teal"
$Colors += "Thistle"
$Colors += "Tomato"
$Colors += "Turquoise"
$Colors += "Violet"
$Colors += "Wheat"
$Colors += "White"
$Colors += "WhiteSmoke"
$Colors += "Yellow"
$Colors += "YellowGreen"

$width = 505
$buttonsize = 200

$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size($width,660)
$image = [System.Drawing.Image]::FromFile("$env:USERPROFILE\Documents\powershell games\SpellingBee\SpellingBeeBackground.jpg")
$Form.BackgroundImage = $image
$Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Form.BackColor = 'Yellow'
$Form.Text = "Spelling Bee"

<#
$Label = New-Object System.Windows.Forms.Label
$Label.TextAlign = "TopCenter"
$Label.Text = "Spelling Bee"
$Label.Font = New-Object System.Drawing.Font("pwsimplehandwriting",36,[System.Drawing.FontStyle]::Italic)
$Label.Location = New-Object System.Drawing.Point(0,0)
$Label.Size = New-Object System.Drawing.Size($width,75)
$Label.SendToBack()
$Label.BackColor = 'Yellow'
$Form.Controls.Add($Label)
#>

$Correct = New-Object System.Windows.Forms.Label
$Correct.TextAlign = "TopCenter"
$Correct.Text = ""
$Correct.Font = New-Object System.Drawing.Font("pwsimplehandwriting",20,[System.Drawing.FontStyle]::Bold)
$Correct.Location = New-Object System.Drawing.Point(($width/2 - 150/2),500)
$Correct.Size = New-Object System.Drawing.Size(150,40)
$Correct.SendToBack()
$Correct.BackColor = 'Yellow'
$Form.Controls.Add($Correct)

$textbox = New-Object System.Windows.Forms.TextBox
$textbox.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$textbox.Location = New-Object System.Drawing.Point(($width/2 - 160),30)
$textbox.Enter
$textbox.BringToFront()
$textbox.Add_KeyDown({                                                         ##This will suppress the windows ding when Enter is pressed
    if ($_.KeyCode -eq "Enter") {
        $_.SuppressKeyPress = $true
        Read-me
    }
})
$textbox.Size = New-Object System.Drawing.Size(300,50)
$Form.Controls.Add($textbox)

$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Say Word"
$Button.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Button.Location = New-Object System.Drawing.Point(($width/2 - $buttonsize/2),175)
$Button.Size = New-Object System.Drawing.Size($buttonsize,50)
$Button.Enabled = $true
$Button.add_click({Read-Me})
$Form.Controls.Add($button)

$Button2 = New-Object System.Windows.Forms.Button
$Button2.Text = "Read Word"
$Button2.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Button2.Location = New-Object System.Drawing.Point(($width/2 - $Buttonsize/2),250)
$Button2.Size = New-Object System.Drawing.Size($Buttonsize,50)
$Button2.Enabled = $true
$Button2.add_click({Skip})
$Form.Controls.Add($button2)

$Button3 = New-Object System.Windows.Forms.Button
$Button3.Text = "Check"
$Button3.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Button3.Location = New-Object System.Drawing.Point(($width/2 - $Buttonsize/2),325)
$Button3.Size = New-Object System.Drawing.Size($Buttonsize,50)
$Button3.Enabled = $true
$Button3.add_click({Read-Letters})
$Form.Controls.Add($Button3)

$Form.ShowDialog()

}

Reader