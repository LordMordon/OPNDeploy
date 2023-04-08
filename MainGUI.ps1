Add-Type -AssemblyName System.Windows.Forms

$MoniorWidth = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Width

$MoniorHeight = [System.Windows.Forms.SystemInformation]::PrimaryMonitorSize.Height


function convertHeigth {
	param(
		[Parameter()]
		[int] $percentage
	)
	
    return (($MoniorHeight / 100) * $percentage)
}

function convertWidth {
	param(
		[Parameter()]
		[int] $percentage
	)
	
    return (($MoniorWidth / 100) * $percentage)
}

function convertText {
	param(
		[Parameter()]
		[int] $percentage
	)
	
    return (((($MoniorWidth / 100) * $percentage) + (($MoniorHeight / 100) * $percentage)) / 2)
}


$GuiBackgroundImage = [system.drawing.image]::FromFile("C:\Users\Lord Mordon\Documents\deploy\gui\Background.png");

$form = New-Object System.Windows.Forms.Form

$form.Text = 'Open Deploy'

$form.Size = New-Object System.Drawing.Size(1024,768)

$form.WindowState = 'Maximized'

$form.FormBorderStyle = 'None'

$form.StartPosition = 'CenterScreen'

$form.BackgroundImage = $GuiBackgroundImage

$form.BackgroundImageLayout = 'Center'

$form.ForeColor             = "#ffffff"


$ButtonUp = New-Object System.Windows.Forms.Button

$ButtonUP.BackColor             = "#707070"

$ButtonUP.text                  = "Capture Image"

$ButtonUP.width                 = convertWidth(9)

$ButtonUP.height                = convertHeigth(3)

$tempButtonpos1 = convertWidth(1)

$tempButtonpos2 = convertHeigth(96)

$ButtonUP.location              = New-Object System.Drawing.Point($tempButtonpos1,$tempButtonpos2)

$ButtonUP.Font                  = ('Microsoft Sans Serif,' + [String](convertText(0.6)))

$ButtonUP.ForeColor             = "#ffffff"

$form.Controls.Add($ButtonUP)




$ButtonUP.Add_Click(
{

     #Start 'C:\Users\Lord Mordon\Documents\deploy\gui\gui.ps1'
     #Writhe-Host "a"
     Start-process PowerShell -argument "-noexit -command 'C:\Users\Lord Mordon\Documents\deploy\gui\gui.ps1'"
     #Write-Output "A"
     #Start-process powershell -argument "'C:\Users\Lord Mordon\Documents\deploy\gui\gui.ps1'"


}
)


$form.ShowDialog()



