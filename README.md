# PowerShell-GUI-Word-Games
A suite of word games for kids created by PowerShell in a gui

##Created by Patrick Cartos February 9, 2019

1. Extract "PowerShell games.zip" to your Documents folder

2. Wordlists are in the "\Documents\PowerShell games\WordList" directory.
	You will need to modify the script in order to change the word lists.
	The variable calling the wordlist is $array. Change the current wordlist to you new wordlist if desired
	Current wordlist is Kindergarten Level
	Wordlists need to be in .txt format and have one word per line.
	Wordlists have already been populated to work for the script.

3. To run from you desktop: Create a shortcut that links to the .ps1 that is located in each respective folder

4. To use the font that is in the script:
	1. Navigate to the \Documents\PowerShell Games\Font directory
	2. Copy PWSimpleHandwriting.ttf to C:\Windows\Fonts directory
	3. The script will now work with this font
	4. To use a font that is on your machine already, follow the instructions
		1.In the script, Ctrl+F "New-Object System.Drawing.Font"
			##This is where all fonts are specified. There are multiple
		2.Replace "pwsimplehandwriting" with the font in your C:\Windows\Fonts directory

5. You will most likely have to change the voice in the script to a voice that installed on your machine.

	To do this run the following commands in a PowerShell Window:

	Add-Type -AssemblyName System.speech
	$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
	$speak.GetInstalledVoices().voiceinfo

	## This will list all installed voices that you can use.
	##To select just the name, run the following
  ##These are the names that you will need to use.
  
	$speak.GetInstalledVoices().voiceinfo.name

	##In the script, make the following changes if necessary 

	$speak.SelectVoice("Microsoft Hazel Desktop")

	##Replace "Microsoft Hazel Desktop" with a name that you have on your machine.
	##To download more voices follow the link below:
		https://www.microsoft.com/en-us/download/details.aspx?id=27224

		##There are many articles out there will walk you through installing and using them	
	## Save the script and let your kids learn

##The SpellingBee game will populate a .txt file with words that you child got right in the SpellingBee folder label with the date + "SpellingBee"
