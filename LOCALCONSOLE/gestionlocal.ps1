Add-Type -AssemblyName System.Windows.Forms

Add-Type -AssemblyName System.Drawing


FUNCTION PARARSERVICIO {
Get-Service | Where-Object {$_.status -eq 'running'}| Out-GridView -Title "Select service to restart" -OutputMode Multiple | Stop-Service –verbose


}


function AnalisisRed()
{
 "ADAPTADORES DE RED" 
  Get-NetAdapter | Out-String 

 "`n"
 "`n"  


 "MÁS INFORMACIÓN SOBRE LOS ADAPTADORES DE RED" 
netsh interface show interface | Out-String 

"`n"
 "`n"

"DETALLES DE LA CONFIGURACION IP" 
Get-NetIPConfiguration | Out-String  


""
}


Function Get-Details{



$Selection = $DropDownBox.SelectedItem.ToString()



if($Selection -eq "SERVICIOS"){

$OutputBox.Text =  Get-Service | Out-String

}

elseif($Selection -eq "SERVICIOS BONITOS"){

$OutputBox.Text = Get-Service | Out-GridView

}

elseif($Selection -eq "PARAR UN SERVICIO"){

$OutputBox.Text = PARARSERVICIO

}

elseif($Selection -eq "PROCESOS"){

$OutputBox.Text = Get-Process | Out-String

}

elseif($Selection -eq "USUARIOS DEL ORDENADOR"){

$OutputBox.Text = Get-LocalUser | Out-String

}

elseif($Selection -eq "CREAR USUARIOS Y ADMINISTRACIÓN DE GRUPOS"){

$OutputBox.Text = C:\Users\HP\OneDrive\Escritorio\usuarios.msc

}

elseif($Selection -eq "CONSOLA DE GESTION"){

$OutputBox.Text = mmc.exe

}







elseif($Selection -eq "ESPACION EN C:"){

$DISCO = (Get-WmiObject -Class Win32_LogicalDisk | select DeviceID,freespace | where DeviceID -eq "C:").freespace/1000000000

$ESPACIO = "ESPACIO DISPONIBLE DEL DISCO C: EN GB ---> $DISCO"  


$OutputBox.Text = $ESPACIO 
 
}


elseif($Selection -eq "ESPACION EN D:"){

$DISCO = (Get-WmiObject -Class Win32_LogicalDisk | select DeviceID,freespace | where DeviceID -eq "C:").freespace/1000

$ESPACIO = "ESPACIO DISPONIBLE DEL DISCO D: EN MB ---> $DISCO"  

$OutputBox.Text = $ESPACIO



}

elseif($Selection -eq "INFORMACIÓN DEL PROCESADOR"){


$OutputBox.Text = Get-WmiObject -Class Win32_Processor | Select -Property  Name, Number*, CurrentClockSpeed | Out-String


}

elseif($Selection -eq "INFORMACIÓN DEL DISCO"){


$OutputBox.Text = Get-Disk | Out-String


}

elseif($Selection -eq "INFORMACIÓN DE LA MEMORIA RAM"){


$OutputBox.Text = Get-WmiObject Win32_PhysicalMemory | ForEach-Object {"GB de memoria ram -->" 
($_.capacity / 1GB) 

"Fabricante -->"
$_.manufacturer

"Número de serie-->"
 $_.serialnumber

"velocidad de la ram-->"
  $_.speed | Out-String
  }


}

elseif($Selection -eq "INFORMACIÓN DEL ORDENADOR/FABRICANTE"){

$1= Get-WmiObject -Class Win32_BIOS

$OutputBox.Text = $1

}

elseif($Selection -eq "INFORMACIÓN DE LA RED"){


$OutputBox.Text = AnalisisRed


}

elseif($Selection -eq "NUMERO DE SERIE DEL PC"){


$OutputBox.Text = gwmi win32_bios | fl SerialNumber


}

}



$Form = New-Object System.Windows.Forms.Form
$Form.Size = New-Object System.Drawing.Size(600,400)
$Form.Text="CONSOLA DE GESTIÓN"
$Form.StartPosition="CenterScreen"
$Form.BackColor = "black"

###############
$img = [System.Drawing.Image]::Fromfile('C:\Users\HP\OneDrive\Escritorio\ASIR 2\ASO\123.png')
$form.BackgroundImage = $img
###############






$DropDownBox = New-Object System.Windows.Forms.ComboBox
$DropDownBox.Location = New-Object System.Drawing.Size(30,80)
$DropDownBox.Size = New-Object System.Drawing.Size(290,20) 
$DropDownBox.Height = 200
$DropDownBox.BackColor = "lightgreen"
$Form.Controls.Add($DropDownBox)


$Details = @("SERVICIOS","SERVICIOS BONITOS","PARAR UN SERVICIO","PROCESOS","USUARIOS DEL ORDENADOR","CREAR USUARIOS Y ADMINISTRACIÓN DE GRUPOS","CONSOLA DE GESTION","ESPACION EN C:","ESPACION EN D:","INFORMACIÓN DEL PROCESADOR","INFORMACIÓN DEL DISCO","INFORMACIÓN DE LA MEMORIA RAM","INFORMACIÓN DEL ORDENADOR/FABRICANTE","INFORMACIÓN DE LA RED","NUMERO DE SERIE DEL PC")



foreach($Detail in $Details){



$DropDownBox.Items.Add($Detail)



}



$OutputBox = New-Object System.Windows.Forms.RichTextBox
$OutputBox.Location = New-Object System.Drawing.Size(20,150)
$OutputBox.Size = New-Object System.Drawing.Size(655,530)
$OutputBox.Multiline = $true
$OutputBox.BackColor = "black"
$OutputBox.ForeColor = "green"
$OutputBox.ScrollBars = "Vertical"
$Form.Controls.Add($OutputBox)





$Button = New-Object System.Windows.Forms.Button
$Button.Location = New-Object System.Drawing.Size(350,65)
$Button.Size = New-Object System.Drawing.Size(100,80)
$Button.Text = "COMPROBAR INFORMACIÓN"
$Button.BackColor =”LightGray”
$Button.Add_Click({Get-Details})
$Form.Controls.Add($Button)



$Label1=New-Object System.Windows.Forms.Label
$Label1.Text="ADMINISTRACIÓN DEL EQUIPO."
$Label1.AutoSize=$True
$Label1.Font= New-Object System.Drawing.Font('Microsoft Sans Serif',17)
$Label1.Location=New-Object System.Drawing.Size(30,30)
$Label1.ForeColor = “lightgreen”


$Form.Controls.Add($Label1)

[void]$Form.ShowDialog()