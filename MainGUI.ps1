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


$GuiBackgroundImage = [system.drawing.image]::FromFile(".\Background.png");

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


$ButtonApllyIMG = New-Object System.Windows.Forms.Button

$ButtonApllyIMG.BackColor             = "#707070"

$ButtonApllyIMG.text                  = "Apply Image"

$ButtonApllyIMG.width                 = convertWidth(9)

$ButtonApllyIMG.height                = convertHeigth(3)

$ButtonApllyIMGpos1 = convertWidth(11)

$ButtonApllyIMGpos2 = convertHeigth(96)

$ButtonApllyIMG.location              = New-Object System.Drawing.Point($ButtonApllyIMGpos1,$ButtonApllyIMGpos2)

$ButtonApllyIMG.Font                  = ('Microsoft Sans Serif,' + [String](convertText(0.6)))

$ButtonApllyIMG.ForeColor             = "#ffffff"

$form.Controls.Add($ButtonApllyIMG)


$Buttonstartcmd = New-Object System.Windows.Forms.Button

$Buttonstartcmd.BackColor             = "#707070"

$Buttonstartcmd.text                  = "CMD"

$Buttonstartcmd.width                 = convertWidth(9)

$Buttonstartcmd.height                = convertHeigth(3)

$Buttonstartcmdpos1 = convertWidth(22)

$Buttonstartcmdpos2 = convertHeigth(96)

$Buttonstartcmd.location              = New-Object System.Drawing.Point($Buttonstartcmdpos1,$Buttonstartcmdpos2)

$Buttonstartcmd.Font                  = ('Microsoft Sans Serif,' + [String](convertText(0.6)))

$Buttonstartcmd.ForeColor             = "#ffffff"

$form.Controls.Add($Buttonstartcmd)




$ButtonUP.Add_Click(
{

     Start-process PowerShell -argument "-noexit -file .\CaptuerImageGUI.ps1" -NoNewWindow

}
)

$ButtonApllyIMG.Add_Click(
{

     Start-process PowerShell -argument "-noexit -file .\ApllyImageGUI.ps1" -NoNewWindow

}
)

$Buttonstartcmd.Add_Click(
{
	Start-process 'X:\Windows\System32\cmd.exe'
}
)


$form.ShowDialog()



