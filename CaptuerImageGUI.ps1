$G = Get-Disk

$G3 = Get-Volume

$G4 = Get-PSDrive

$SelectetDirveNumber = 0;

$global:SelectetDirveLeter = "";

 

Add-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName System.Drawing

 

[System.Windows.Forms.Application]::EnableVisualStyles()

 

$form = New-Object System.Windows.Forms.Form

$form.Text = 'Capture Image'

$form.Size = New-Object System.Drawing.Size(763,243)

$form.StartPosition = 'CenterScreen'

$form.FormBorderStyle = 'Fixed3D'

$form.BackColor             = "#303030"

$form.ForeColor             = "#ffffff"

$form.MaximizeBox = $false

 

$ButtonUp = New-Object System.Windows.Forms.Button

$ButtonUP.BackColor             = "#707070"

$ButtonUP.text                  = "UP"

$ButtonUP.width                 = 70

$ButtonUP.height                = 30

$ButtonUP.location              = New-Object System.Drawing.Point(140,0)

$ButtonUP.Font                  = 'Microsoft Sans Serif,10'

$ButtonUP.ForeColor             = "#ffffff"

 

$ButtonDown = New-Object System.Windows.Forms.Button

$ButtonDown.BackColor             = "#707070"

$ButtonDown.text                  = "Down"

$ButtonDown.width                 = 70

$ButtonDown.height                = 30

$ButtonDown.location              = New-Object System.Drawing.Point(0,0)

$ButtonDown.Font                  = 'Microsoft Sans Serif,10'

$ButtonDown.ForeColor             = "#ffffff"

 

$G2 = Get-Partition -DiskNumber $SelectetDirveNumber

 

$DriveSelectetLabel = New-Object System.Windows.Forms.Label

$DriveSelectetLabel.Location = New-Object System.Drawing.Point(73,5)

$DriveSelectetLabel.Font                  = 'Microsoft Sans Serif,10'

$DriveSelectetLabel.Size = New-Object System.Drawing.Size(75,30)

$DriveSelectetLabel.Text = ("Disk: " + ($SelectetDirveNumber + 1) + " / " + ($G.DiskNumber.Length))

 

$cancelBtn                       = New-Object system.Windows.Forms.Button

$cancelBtn.BackColor             = "#707070"

$cancelBtn.text                  = "Cancel"

$cancelBtn.width                 = 90

$cancelBtn.height                = 30

$cancelBtn.location              = New-Object System.Drawing.Point(0,180)

$cancelBtn.Font                  = 'Microsoft Sans Serif,10'

$cancelBtn.ForeColor             = "#ffffff"

$cancelBtn.DialogResult          = [System.Windows.Forms.DialogResult]::Cancel

$form.CancelButton   = $cancelBtn

$form.Controls.Add($cancelBtn)

 

$captureBtn                       = New-Object system.Windows.Forms.Button

$captureBtn.BackColor             = "#707070"

$captureBtn.text                  = "Save Image"

$captureBtn.width                 = 115

$captureBtn.height                = 30

$captureBtn.location              = New-Object System.Drawing.Point(637,180)

$captureBtn.Font                  = 'Microsoft Sans Serif,10'

$captureBtn.ForeColor             = "#ffffff"

$form.Controls.Add($captureBtn)

 

$objTextBox = New-Object System.Windows.Forms.TextBox

$objTextBox.Location = New-Object System.Drawing.Size(100,185)

$objTextBox.Size = New-Object System.Drawing.Size(500,20)

$objTextBox.Text = "X:\Beispiel.wim"

$form.Controls.Add($objTextBox)

 

$objCompressionLabel = New-Object System.Windows.Forms.Label

$objCompressionLabel.Location = New-Object System.Drawing.Size(213,5)

$objCompressionLabel.Size     = New-Object System.Drawing.Size(90,20)

$objCompressionLabel.Font     = 'Microsoft Sans Serif,10'

$objCompressionLabel.Text     = "Compression:"

$form.Controls.Add($objCompressionLabel)

 

$objCombobox = New-Object System.Windows.Forms.Combobox

# Die nächsten beiden Zeilen legen die Position und die Größe des Buttons fest

$objCombobox.Location = New-Object System.Drawing.Size(305,5)

$objCombobox.Size = New-Object System.Drawing.Size(100,20)

$objCombobox.Height = 70

$form.Controls.Add($objCombobox)

$form.Topmost = $True

[void] $objCombobox.Items.Add("Max")

[void] $objCombobox.Items.Add("Fast")

[void] $objCombobox.Items.Add("None")

$objCombobox.Add_SelectedIndexChanged({ })

$objCombobox.SelectedIndex = 1

 

$objTypeCheckbox = New-Object System.Windows.Forms.Checkbox

$objTypeCheckbox.Location = New-Object System.Drawing.Size(420,5)

$objTypeCheckbox.Size = New-Object System.Drawing.Size(500,20)

$objTypeCheckbox.Font       = 'Microsoft Sans Serif,10'

$objTypeCheckbox.Text       = ":Verify"

$objTypeCheckbox.TabIndex = 1

$form.Controls.Add($objTypeCheckbox)



$objSelectetPatitionLabel2 = New-Object System.Windows.Forms.Label

$objSelectetPatitionLabel2.Location = New-Object System.Drawing.Point(637,5)

$objSelectetPatitionLabel2.Size     = New-Object System.Drawing.Size(100,20)

$objSelectetPatitionLabel2.Font     = 'Microsoft Sans Serif,10'

$objSelectetPatitionLabel2.Text     = "Selectet Patition:"

#$form.Controls.Add($objSelectetPatitionLabel2)

 

 

 

 

$Button = New-Object System.Windows.Forms.Button

$Button.BackColor             = "#c2bebe"

$Button.ForeColor             = "#000000"

$Button.Location = New-Object System.Drawing.Point(0,30)

$Button.Size = New-Object System.Drawing.Size(150,150)

$tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

$ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + „{0:N2}“ –f (($tempDrive.Size) / 1073741824) + " GB")

$Button.Text = $ButtonText

$form.Controls.Add($Button)

 

## Partitions Gafic Wiht buttons Initaliation ##

 

 

$MaxNumberOfButtons = 0;

 

for($i = 0; ($G.Number.Length) -gt $i; $i++){

 

    if($MaxNumberOfButtons -lt $G[$i].NumberOfPartitions){

        $MaxNumberOfButtons = $G[$i].NumberOfPartitions

    }

 

}

 
$tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

$GeneralPlus = [Int](400 / ($tempDrive.NumberOfPartitions))

$Button7 = [Object[]]::new($MaxNumberOfButtons)

$ButtonSize7 = [Int64[]]::new($MaxNumberOfButtons)

$ButtonFreeSize7 = [String[]]::new($MaxNumberOfButtons)

$ButtonText7 = [String[]]::new($MaxNumberOfButtons)

$ButtonName7 = [String[]]::new($MaxNumberOfButtons)

$sizeOfAllErlierButtons = 150

 

    for($i = 0; $Button7.Length -gt $i; $i++){

 

        $Button7[$i] = New-Object System.Windows.Forms.Button

 

    }

 

 $tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

    for($i = 0; $tempDrive.NumberOfPartitions -gt $i; $i++){

        $Button7[$i].BackColor = '#a6e3e3'

        $Button7[$i].ForeColor = "#000000"

        $ButtonSize7[$i] = [Int64](((200 / ($tempDrive.Size / 1073741824)) * ($G2[$i].Size / 1073741824)) + $GeneralPlus)

        $Button7[$i].Location = New-Object System.Drawing.Point($sizeOfAllErlierButtons,30)

        $Button7[$i].Size = New-Object System.Drawing.Size($ButtonSize7[$i],150)

        $ButtonName7[$i] = $G2[$i].Type

        if($G2[$i].Size -gt 1073741824){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size)) + " B")

        }

        if($G2[$i].DriveLetter -eq $global:SelectetDirveLeter)
        {

            $Button7[$i].BackColor = '#3333ff'

        }

        #$ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        $Button7[$i].Text = $ButtonText7[$i]

        $Button7[$i].Name = $G2[$i].DriveLetter

        $form.Controls.Add($Button7[$i])

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name; $this.BackColor = '#3333ff'});

        $sizeOfAllErlierButtons = $sizeOfAllErlierButtons + $ButtonSize7[$i];

    }

 

 

## END Partitions Gafic Wiht buttons Initaliation ##

 

## Drive Selection Handler UPButton ##   

 

$ButtonUP.Add_Click(

{

If($global:SelectetDirveNumber -lt ($G.Number.Length -1)){$global:SelectetDirveNumber = ($global:SelectetDirveNumber + 1)};

Write-Host $SelectetDirveNumber

$tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

$G2 = Get-Partition -DiskNumber $tempDrive.Number

$IamgeFilleindexToSafe =  2;

$GeneralPlus = [Int](400 / ($tempDrive.NumberOfPartitions))

$DriveSelectetLabel.Text = ("Disk: " + ($SelectetDirveNumber + 1) + " / " + ($G.DiskNumber.Length))

$Button.Location = New-Object System.Drawing.Point(0,30)

$Button.Size = New-Object System.Drawing.Size(150,150)

$ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + „{0:N2}“ –f (($tempDrive.Size) / 1073741824) + " GB")

$Button.Text = $ButtonText

$sizeOfAllErlierButtons = 150

for($a = 0; $Button7.Length -gt $a; $a++){

 

            $Button7[$a].Visible = $false

 

}

for($i = 0; $G2.PartitionNumber.Length -gt $i; $i++){

        $Button7[$i].BackColor = '#a6e3e3'

        $Button7[$i].ForeColor             = "#000000"

        $ButtonSize7[$i] = [Int64](((200 / ($tempDrive.Size / 1073741824)) * ($G2[$i].Size / 1073741824)) + $GeneralPlus)

        $Button7[$i].Location = New-Object System.Drawing.Point($sizeOfAllErlierButtons,30)

        $Button7[$i].Size = New-Object System.Drawing.Size($ButtonSize7[$i],150)

        if($G2[$i].Size -gt 1073741824){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size)) + " B")

        }

        if($G2[$i].DriveLetter -eq $global:SelectetDirveLeter)
        {

            $Button7[$i].BackColor = '#3333ff'

        }

        #$ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        $Button7[$i].Text = $ButtonText7[$i]

        $Button7[$i].Name = $G2[$i].DriveLetter

        $Button7[$i].Visible = $true

        $form.Controls.Add($Button7[$i])

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name; $this.BackColor = '#3333ff'});

        $sizeOfAllErlierButtons = $sizeOfAllErlierButtons + $ButtonSize7[$i];

    }

}

)

 

 

## END Drive Selection Handler UPButton ##  

 

 

 

## Drive Selection Handler DownButton ##  

 

$ButtonDown.Add_Click(

{

  If($SelectetDirveNumber -gt 0){$global:SelectetDirveNumber = ($SelectetDirveNumber - 1)};

  $IamgeFilleindexToSafe = 2;

  $tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

  $GeneralPlus = [Int](400 / ($tempDrive.NumberOfPartitions))

  $DriveSelectetLabel.Text = ("Disk: " + ($tempDrive.Number + 1) + " / " + ($G.Number.Length))

  $G2 = Get-Partition -DiskNumber $tempDrive.Number

  $Button.Location = New-Object System.Drawing.Point(0,30)

  $Button.Size = New-Object System.Drawing.Size(150,150)

  $ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + „{0:N2}“ –f (($tempDrive.Size) / 1073741824) + " GB")

  $Button.Text = $ButtonText

  $sizeOfAllErlierButtons = 150

  for($a = 0; $Button7.Length -gt $a; $a++){

 

            $Button7[$a].Visible = $false

 

  }

  for($i = 0; $G2.PartitionNumber.Length -gt $i; $i++){

        $Button7[$i].BackColor = '#a6e3e3'

        $Button7[$i].ForeColor             = "#000000"

        $ButtonSize7[$i] = [Int64](((200 / ($tempDrive.Size / 1073741824)) * ($G2[$i].Size / 1073741824)) + $GeneralPlus)

        $Button7[$i].Location = New-Object System.Drawing.Point($sizeOfAllErlierButtons,30)

        $Button7[$i].Size = New-Object System.Drawing.Size($ButtonSize7[$i],150)

        if($G2[$i].Size -gt 1073741824){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size)) + " B")

        }

        if($G2[$i].DriveLetter -eq $global:SelectetDirveLeter)
        {

            $Button7[$i].BackColor = '#3333ff'

        }

        #$ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        $Button7[$i].Text = $ButtonText7[$i]

        $Button7[$i].Name = $G2[$i].DriveLetter

        $Button7[$i].Visible = $true

        $form.Controls.Add($Button7[$i])

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name; $this.BackColor = '#3333ff'});

        $sizeOfAllErlierButtons = $sizeOfAllErlierButtons + $ButtonSize7[$i];

    }

}

)

 

 

 

## END Drive Selection Handler DownButton ## 

 

$captureBtn.Add_Click(

{

    if($objTypeCheckbox.Checked -eq $true){

        New-WindowsImage -ImagePath $objTextBox.Text -CapturePath ( $SelectetDirveLeter + ":\") -Name "Capturet Image" -Verify -CompressionType $objCombobox.text

    }

    else{

        New-WindowsImage -ImagePath $objTextBox.Text -CapturePath ( $SelectetDirveLeter + ":\") -Name "Capturet Image" -CompressionType $objCombobox.text

    }

}

)

 

 

 

 

$form.Controls.Add($ButtonDown)

$form.Controls.Add($ButtonUp)

$form.Controls.Add($DriveSelectetLabel)

 

$form.ShowDialog()

 

 

Write-Output $G;

Write-Output $SelectetDirveNumber;