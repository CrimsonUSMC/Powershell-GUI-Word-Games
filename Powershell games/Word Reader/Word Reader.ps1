##Created by Patrick Cartos
##2/9/2019
##e-mail - cartos8992@gmail.com
##github - https://github.com/CrimsonUSMC

Function Read-me{

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.SelectVoice("Microsoft Hazel Desktop")
$speak.Rate = -3
$speak.Volume = 100
   
$speak.Speak($textbox.text)

}

Function Read-Letters{

Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
$speak.SelectVoice("Microsoft Hazel Desktop")
$speak.Rate = -3
    
    foreach($letter in ($textbox.text -split (''))){
    $speak.Speak($letter)
    }

}

Function Reader{

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

$width = 473
$buttonsize = 200

$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size($width,500)
$image = [System.Drawing.Image]::FromFile("$env:USERPROFILE\Documents\powershell games\Word Reader\openbook.jpg")
$Form.BackgroundImage = $image
$Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$Form.BackColor = 'White'

$Label = New-Object System.Windows.Forms.Label
$Label.TextAlign = "TopCenter"
$Label.Text = "Word Reader: `n  Type your word below"
$Label.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Label.Location = New-Object System.Drawing.Point(0,0)
$Label.Size = New-Object System.Drawing.Size($width,75)
$Label.SendToBack()
$Label.BackColor = 'Transparent'
$Form.Controls.Add($Label)

$textbox = New-Object System.Windows.Forms.TextBox
$textbox.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$textbox.Location = New-Object System.Drawing.Point(0,100)
$textbox.Enter
$textbox.BringToFront()
$textbox.Add_KeyDown({
    if ($_.KeyCode -eq "Enter") {
        $_.SuppressKeyPress = $true
        Read-me
    }
})
$textbox.Size = New-Object System.Drawing.Size($width,50)
$Form.Controls.Add($textbox)

$Button = New-Object System.Windows.Forms.Button
$Button.Text = "Read Word"
$Button.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Button.Location = New-Object System.Drawing.Point(($width/2 - $buttonsize/2),175)
$Button.Size = New-Object System.Drawing.Size($buttonsize,50)
$Button.Enabled = $true
$Button.BackColor = 'White'
$Button.add_click({Read-Me})
$Form.Controls.Add($button)

$Button2 = New-Object System.Windows.Forms.Button
$Button2.Text = "Read Letters"
$Button2.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
$Button2.Location = New-Object System.Drawing.Point(($width/2 - $Buttonsize/2),225)
$Button2.Size = New-Object System.Drawing.Size($Buttonsize,50)
$Button2.Enabled = $true
$Button2.BackColor = 'White'
$Button2.add_click({Read-Letters})
$Form.Controls.Add($button2)

$Form.ShowDialog()

}

Reader