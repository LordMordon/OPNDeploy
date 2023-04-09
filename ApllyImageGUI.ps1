$G = Get-Disk

$G3 = Get-Volume

$G4 = Get-PSDrive

$SelectetDirveNumber = 0;

$global:SelectetDirveLeter = "";

$global:SelectetDirveApplyNumber;

 

Add-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName System.Drawing

 

[System.Windows.Forms.Application]::EnableVisualStyles()

 

$form = New-Object System.Windows.Forms.Form

$form.Text = 'Aplly Image'

$form.Size = New-Object System.Drawing.Size(772,253)

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

$captureBtn.text                  = "Aplly Image"

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

$objCompressionLabel.Text     = "Startup Type:"

$form.Controls.Add($objCompressionLabel)

 

$objCombobox = New-Object System.Windows.Forms.Combobox

# Die nächsten beiden Zeilen legen die Position und die Größe des Buttons fest

$objCombobox.Location = New-Object System.Drawing.Size(305,5)

$objCombobox.Size = New-Object System.Drawing.Size(100,20)

$objCombobox.Height = 70

$form.Controls.Add($objCombobox)

$form.Topmost = $True

[void] $objCombobox.Items.Add("Bios")

[void] $objCombobox.Items.Add("Uefi")

$objCombobox.Add_SelectedIndexChanged({ })

$objCombobox.SelectedIndex = 1

 

$objTypeCheckbox = New-Object System.Windows.Forms.Checkbox

$objTypeCheckbox.Location = New-Object System.Drawing.Size(420,5)

$objTypeCheckbox.Size = New-Object System.Drawing.Size(130,20)

$objTypeCheckbox.Font       = 'Microsoft Sans Serif,10'

$objTypeCheckbox.Text       = ":Recovery Pation"

$objTypeCheckbox.TabIndex = 1

$form.Controls.Add($objTypeCheckbox)


$objTypeCheckboxCompactOS = New-Object System.Windows.Forms.Checkbox

$objTypeCheckboxCompactOS.Location = New-Object System.Drawing.Size(550,5)

$objTypeCheckboxCompactOS.Size = New-Object System.Drawing.Size(110,20)

$objTypeCheckboxCompactOS.Font       = 'Microsoft Sans Serif,10'

$objTypeCheckboxCompactOS.Text       = ":Compact OS"

$objTypeCheckboxCompactOS.TabIndex = 1

$form.Controls.Add($objTypeCheckboxCompactOS)


$objTypeCheckboxEA = New-Object System.Windows.Forms.Checkbox

$objTypeCheckboxEA.Location = New-Object System.Drawing.Size(660,5)

$objTypeCheckboxEA.Size = New-Object System.Drawing.Size(500,20)

$objTypeCheckboxEA.Font       = 'Microsoft Sans Serif,10'

$objTypeCheckboxEA.Text       = ":EA"

$objTypeCheckboxEA.TabIndex = 1

$form.Controls.Add($objTypeCheckboxEA)



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

$ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + "{0:N2}" -f (($tempDrive.Size) / 1073741824) + " GB")

$Button.Text = $ButtonText

$form.Controls.Add($Button)

$Button.Add_Click({$global:SelectetDirveApplyNumber = $SelectetDirveNumber; $this.BackColor = '#3333ff'});

 

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

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($ButtonName7[$i] + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size)) + " B")

        }

        if($G2[$i].DriveLetter -eq $global:SelectetDirveLeter)
        {

            $Button7[$i].BackColor = '#3333ff'

        }

        #$ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + „{0:N2}“ –f (($G2[$i].Size) / 1048576) + " MB")

        $Button7[$i].Text = $ButtonText7[$i]

        $Button7[$i].Name = $G2[$i].DriveLetter

        $form.Controls.Add($Button7[$i])

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name});

        $sizeOfAllErlierButtons = $sizeOfAllErlierButtons + $ButtonSize7[$i];

    }

 

 

## END Partitions Gafic Wiht buttons Initaliation ##

 

## Drive Selection Handler UPButton ##   

 

$ButtonUP.Add_Click(

{

If($global:SelectetDirveNumber -lt ($G.Number.Length -1)){$global:SelectetDirveNumber = ($global:SelectetDirveNumber + 1)};

#Write-Host $SelectetDirveNumber

$tempDrive = $G | Where-Object Number -eq $SelectetDirveNumber

$G2 = Get-Partition -DiskNumber $tempDrive.Number

$IamgeFilleindexToSafe =  2;

$GeneralPlus = [Int](400 / ($tempDrive.NumberOfPartitions))

$DriveSelectetLabel.Text = ("Disk: " + ($SelectetDirveNumber + 1) + " / " + ($G.DiskNumber.Length))

$Button.Location = New-Object System.Drawing.Point(0,30)

$Button.Size = New-Object System.Drawing.Size(150,150)

$ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + "{0:N2}" -f (($tempDrive.Size) / 1073741824) + " GB")

$Button.Text = $ButtonText

if($global:SelectetDirveNumber -eq $global:SelectetDirveApplyNumber){
    $Button.BackColor = '#3333ff'
}else{
    $Button.BackColor = '#c2bebe'
}

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

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size)) + " B")

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

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name});

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

  $ButtonText = ("Name:`n" + $tempDrive.FriendlyName + "`nDiskNumber: " + $tempDrive.Number + "`n Size:" + "{0:N2}" -f (($tempDrive.Size) / 1073741824) + " GB")

  $Button.Text = $ButtonText

  if($global:SelectetDirveNumber -eq $global:SelectetDirveApplyNumber){
    $Button.BackColor = '#3333ff'
  }else{
    $Button.BackColor = '#c2bebe'
  }

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

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1073741824) + " GB")

        }elseif($G2[$i].Size -gt 1048576){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1048576) + " MB")

        }elseif($G2[$i].Size -gt 1024){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size) / 1024) + " KB")

        }elseif($G2[$i].Size -gt 0){

            $ButtonText7[$i] = ($G2[$i].Type + "(" + $G2[$i].DriveLetter + ")" + "`n Size:" + "{0:N2}" -f (($G2[$i].Size)) + " B")

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

        $Button7[$i].Add_Click({$global:SelectetDirveLeter = $this.Name});

        $sizeOfAllErlierButtons = $sizeOfAllErlierButtons + $ButtonSize7[$i];

    }

}

)

 

 

 

## END Drive Selection Handler DownButton ## 

 

$captureBtn.Add_Click(
{

    if($objCombobox.Text -eq "Uefi"){
        if($objTypeCheckbox.Checked -eq $true){
            #$tempdism = Get-Content '.\CreatePartitions-UEFI.txt'
            #$temcaomands = "select disk $($global:SelectetDirveApplyNumber)" | Out-File -FilePath '.\tempdismcommands.txt'
            #$temcaomands2 = $tempdism | Out-File -FilePath '.\tempdismcommands.txt' -Append
            #Get-Disk $global:SelectetDirveApplyNumber | Clear-Disk -RemoveData
            #New-Partition -DiskNumber 1 -Size 100 -IsActive -DriveLetter S | Format-Volume -FileSystem fat32 -NewFileSystemLabel System
            $filecontent = Get-Content -Path '.\CreatePartitions-UEFI.txt'
            $filecontent[7] = $filecontent[7] -replace $filecontent[7],"select disk $($global:SelectetDirveApplyNumber)"
            Set-Content -Path '.\CreatePartitions-UEFI.txt' -Value $filecontent
            Start-Sleep -Seconds 15
            Start-process DISKPART -argument "/s CreatePartitions-UEFI.txt"
            if($objTypeCheckboxCompactOS.Checked -eq $true){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact -SupportEa
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
            }
            elseif($objTypeCheckboxCompactOS.Checked -eq $false){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -SupportEa
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
            }
        }else{
            #Start-process DISKPART -argument "select disk $($global:SelectetDirveApplyNumber)"
            #Start-process DISKPART -argument "/s CreatePartitions-UEFI-FFU.txt"
            #$tempdism = Get-Content '.\CreatePartitions-UEFI-FFU.txt'
            #$temcaomands = "select disk $($global:SelectetDirveApplyNumber)" | Out-File -FilePath '.\tempdismcommands.txt'
            #$temcaomands2 = $tempdism | Out-File -FilePath '.\tempdismcommands.txt' -Append
            $filecontent = Get-Content -Path '.\CreatePartitions-UEFI-FFU.txt'
            $filecontent[7] = $filecontent[7] -replace $filecontent[7],'select disk $($global:SelectetDirveApplyNumber)'
            Set-Content -Path '.\CreatePartitions-UEFI-FFU.txt' -Value $filecontent
            Start-Sleep -Seconds 15
            Start-process DISKPART -argument "/s CreatePartitions-UEFI-FFU.txt"
            if($objTypeCheckboxCompactOS.Checked -eq $true){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact -SupportEa
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
            }
            elseif($objTypeCheckboxCompactOS.Checked -eq $false){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -SupportEa
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
            }
            
        }
    }
    
    if($objCombobox.Text -eq "Bios"){
        if($objTypeCheckbox.Checked -eq $true){
            #Start-process DISKPART -argument "select disk $($global:SelectetDirveApplyNumber)"
            #Start-process DISKPART -argument "/s CreatePartitions-BIOS.txt"
            $filecontent = Get-Content -Path '.\CreatePartitions-BIOS.txt'
            $filecontent[7] = $filecontent[7] -replace $filecontent[7],'select disk $($global:SelectetDirveApplyNumber)'
            Set-Content -Path '.\CreatePartitions-BIOS.txt' -Value $filecontent
            #$tempdism = Get-Content '.\CreatePartitions-BIOS.txt'
            #$temcaomands = "select disk $($global:SelectetDirveApplyNumber)" | Out-File -FilePath '.\tempdismcommands.txt'
            #$temcaomands2 = $tempdism | Out-File -FilePath '.\tempdismcommands.txt' -Append
            Start-Sleep -Seconds 15
            Start-process DISKPART -argument "/s CreatePartitions-BIOS.txt"
            if($objTypeCheckboxCompactOS.Checked -eq $true){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact -SupportEa
                    Start-Process '.\applyimgdismp2.bat' -Verb RunAs
                }
            }
            elseif($objTypeCheckboxCompactOS.Checked -eq $false){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1
                    Start-Process '.\applyimgdismp3.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -SupportEa
                    Start-Process '.\applyimgdismp4.bat' -Verb RunAs
                }
            }
        }else{
            #Start-process DISKPART -argument "select disk $($global:SelectetDirveApplyNumber)"
            #Start-process DISKPART -argument "/s CreatePartitions-BIOS-FFU.txt"
            #$tempdism = Get-Content '.\CreatePartitions-BIOS-FFU.txt'
            #$temcaomands = "select disk $($global:SelectetDirveApplyNumber)" | Out-File -FilePath '.\tempdismcommands.txt'
            #$temcaomands2 = $tempdism | Out-File -FilePath '.\tempdismcommands.txt' -Append
            $filecontent = Get-Content -Path '.\CreatePartitions-BIOS-FFU.txt'
            $filecontent[7] = $filecontent[7] -replace $filecontent[7],'select disk $($global:SelectetDirveApplyNumber)'
            Set-Content -Path '.\CreatePartitions-BIOS-FFU.txt' -Value $filecontent
            Start-Sleep -Seconds 15
            Start-process DISKPART -argument "/s CreatePartitions-BIOS-FFU.txt"
            if($objTypeCheckboxCompactOS.Checked -eq $true){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact
                    Start-Process '.\applyimgdismp1.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -Compact -SupportEa
                    Start-Process '.\applyimgdismp2.bat' -Verb RunAs
                }
            }
            elseif($objTypeCheckboxCompactOS.Checked -eq $false){
                if($objTypeCheckboxEA.Checked -eq $false){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1
                    Start-Process '.\applyimgdismp3.bat' -Verb RunAs
                }
                if($objTypeCheckboxEA.Checked -eq $true){
                    Start-Sleep -Seconds 20
                    Expand-WindowsImage -ImagePath $objTextBox.Text -ApplyPath "w:\" -Index 1 -SupportEa
                    Start-Process '.\applyimgdismp4.bat' -Verb RunAs
                }
            }
        }
    }

}
)

 

 

 

 

$form.Controls.Add($ButtonDown)

$form.Controls.Add($ButtonUp)

$form.Controls.Add($DriveSelectetLabel)

 

$form.ShowDialog()

 

 

#Write-Output $G;

#Write-Output $SelectetDirveNumber;