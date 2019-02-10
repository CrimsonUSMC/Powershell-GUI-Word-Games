##Created by Patrick Cartos
##2/9/2019
##e-mail - cartos8992@gmail.com
##github - https://github.com/CrimsonUSMC

$array = Get-Content "$env:USERPROFILE\Documents\powershell games\WordList\jr_k_words.txt"

Function Read-me{
    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SelectVoice("Microsoft Hazel Desktop")
    $speak.Rate = -3
    $speak.Volume = 100
    $speak.Speak($text)
    }

Function One{
    $text = $1.text
    $1.BackColor = 'Green'
    Read-me
    }

Function Two{
    $text = $2.text
    $2.BackColor = 'Green'
    Read-me
    }

Function Three{
    $text = $3.text
    $3.BackColor = 'Green'
    Read-me
    }

Function Four{
    $text = $4.text
    $4.BackColor = 'Green'
    Read-me
    }

Function Five{
    $text = $5.text
    $5.BackColor = 'Green'
    Read-me
    }

Function Six{
    $text = $6.text
    $6.BackColor = 'Green'
    Read-me
    }

Function Seven{
    $text = $7.text
    $7.BackColor = 'Green'
    Read-me
    }

Function Eight{
    $text = $8.text
    $8.BackColor = 'Green'
    Read-me
    }


Function Nine{
    $text = $9.text
    $9.BackColor = 'Green'
    Read-me
    }


Function Ten{
    $text = $10.text
    $10.BackColor = 'Green'
    Read-me
    }


Function Eleven{
    $text = $11.text
    $11.BackColor = 'Green'
    Read-me
    }


Function Twelve{
    $text = $12.text
    $12.BackColor = 'Green'
    Read-me
    }



Function Refresh{
    $Form.Close()
    $Form.Dispose()
    Reader
    }


Function Reader{

    $array = $array | Sort-Object {get-random}

    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing

    $width = 500
    $Buttonx = 20
    $Buttony = 170

    $Form = New-Object System.Windows.Forms.Form
    $Form.Size = New-Object System.Drawing.Size($width,325)
    $Form.BackColor = "White"
    $image = [System.Drawing.Image]::FromFile("$env:USERPROFILE\Documents\powershell games\SpellingWords\crayons.jpg")
    $Form.BackgroundImage = $image
    $Form.BackgroundImage.PixelFormat
    $Form.AutoSize = $true
    $Form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
    $Form.BackgroundImage

    $Label = New-Object System.Windows.Forms.Label
    $Label.TextAlign = "TopCenter"
    $Label.Text = "Click the words to hear them"
    $Label.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $Label.Location = New-Object System.Drawing.Point(0,0)
    $Label.ForeColor = "White"
    $Label.BackColor = 'Transparent'
    #$Label.Image = $image
    $Label.Size = New-Object System.Drawing.Size($width,50)
    $Form.Controls.Add($Label)

    $Refresh = New-Object System.Windows.Forms.Button
    $image = [System.Drawing.Image]::FromFile("$env:USERPROFILE\Documents\powershell games\SpellingWords\Refresh.png")
    $Refresh.Image = $image
    $Refresh.AutoSize = $true
    $Refresh.Location = New-Object System.Drawing.Point(($width/2 - 50),50)
    $Refresh.Size = New-Object System.Drawing.Size(100,50)
    $Refresh.Enabled = $true
    $Refresh.add_click({Refresh})
    $Form.Controls.Add($Refresh)

    $1 = New-Object System.Windows.Forms.Button
    $1.Text = $array[0]
    $1.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $1.Location = New-Object System.Drawing.Point($Buttonx,$Buttony) #(Horizontal,Vertical)
    $1.Size = New-Object System.Drawing.Size(200,50)
    $1.Enabled = $true
    $1.add_click({One})
    $Form.Controls.Add($1)

    $2 = New-Object System.Windows.Forms.Button
    $2.Text = $array[1]
    $2.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $2.Location = New-Object System.Drawing.Point($Buttonx,($Buttony + 75))
    $2.Size = New-Object System.Drawing.Size(200,50)
    $2.Enabled = $true
    $2.add_click({Two})
    $Form.Controls.Add($2)

    $3 = New-Object System.Windows.Forms.Button
    $3.Text = $array[2]
    $3.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $3.Location = New-Object System.Drawing.Point($Buttonx,($Buttony + 150))
    $3.Size = New-Object System.Drawing.Size(200,50)
    $3.Enabled = $true
    $3.add_click({Three})
    $Form.Controls.Add($3)

    $4 = New-Object System.Windows.Forms.Button
    $4.Text = $array[3]
    $4.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $4.Location = New-Object System.Drawing.Point($Buttonx,($Buttony + 225))
    $4.Size = New-Object System.Drawing.Size(200,50)
    $4.Enabled = $true
    $4.add_click({Four})
    $Form.Controls.Add($4)

    $5 = New-Object System.Windows.Forms.Button
    $5.Text = $array[4]
    $5.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $5.Location = New-Object System.Drawing.Point($Buttonx,($Buttony + 300))
    $5.Size = New-Object System.Drawing.Size(200,50)
    $5.Enabled = $true
    $5.add_click({Five})
    $Form.Controls.Add($5)

    $6 = New-Object System.Windows.Forms.Button
    $6.Text = $array[5]
    $6.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $6.Location = New-Object System.Drawing.Point($Buttonx,($Buttony + 375))
    $6.Size = New-Object System.Drawing.Size(200,50)
    $6.Enabled = $true
    $6.add_click({Six})
    $Form.Controls.Add($6)

    $7 = New-Object System.Windows.Forms.Button
    $7.Text = $array[6]
    $7.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $7.Location = New-Object System.Drawing.Point(($Buttonx + 250),$Buttony)
    $7.Size = New-Object System.Drawing.Size(200,50)
    $7.Enabled = $true
    $7.add_click({Seven})
    $Form.Controls.Add($7)

    $8 = New-Object System.Windows.Forms.Button
    $8.Text = $array[7]
    $8.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $8.Location = New-Object System.Drawing.Point(($Buttonx + 250),($Buttony + 75))
    $8.Size = New-Object System.Drawing.Size(200,50)
    $8.Enabled = $true
    $8.add_click({Eight})
    $Form.Controls.Add($8)

    $9 = New-Object System.Windows.Forms.Button
    $9.Text = $array[8]
    $9.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $9.Location = New-Object System.Drawing.Point(($Buttonx + 250),($Buttony + 150))
    $9.Size = New-Object System.Drawing.Size(200,50)
    $9.Enabled = $true
    $9.add_click({Nine})
    $Form.Controls.Add($9)

    $10 = New-Object System.Windows.Forms.Button
    $10.Text = $array[9]
    $10.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $10.Location = New-Object System.Drawing.Point(($Buttonx + 250),($Buttony + 225))
    $10.Size = New-Object System.Drawing.Size(200,50)
    $10.Enabled = $true
    $10.add_click({Ten})
    $Form.Controls.Add($10)

    $11 = New-Object System.Windows.Forms.Button
    $11.Text = $array[10]
    $11.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $11.Location = New-Object System.Drawing.Point(($Buttonx + 250),($Buttony + 300))
    $11.Size = New-Object System.Drawing.Size(200,50)
    $11.Enabled = $true
    $11.add_click({Eleven})
    $Form.Controls.Add($11)

    $12 = New-Object System.Windows.Forms.Button
    $12.Text = $array[11]
    $12.Font = New-Object System.Drawing.Font("pwsimplehandwriting",24,[System.Drawing.FontStyle]::Bold)
    $12.Location = New-Object System.Drawing.Point(($Buttonx + 250),($Buttony + 375))
    $12.Size = New-Object System.Drawing.Size(200,50)
    $12.Enabled = $true
    $12.add_click({Twelve})
    $Form.Controls.Add($12)

    $Form.ShowDialog()
    }

Reader

