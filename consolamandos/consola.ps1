Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
 
#Crear un formulario, añadir una etiqueta, dos botones y una caja de texto
#Funcionalidad para el formulario:
#Pulsar la tecla Enter almacena en una variable el contenido de la caja de texto y se muestra
#Pulsar la tecla Escape sale del formulario
 

 #########################
 ##      TITULOS        ##
 #########################


#GESTOR DE ADMINISTRACIÓN DE APLICACIONES, PROCESOS Y SERVICIOS.
$Form = New-Object System.Windows.Forms.Form
$Form.Text="GESTOR DE ADMINISTRACIÓN DE APLICACIONES, PROCESOS Y SERVICIOS."
$Form.Size=New-Object System.Drawing.Size(500,500)
$Form.StartPosition="CenterScreen"
$Form.BackColor = "lightblue"
 
#PROGRAMAS Y APLICACIONES
$Label1=New-Object System.Windows.Forms.Label
$Label1.Text="PROGRAMAS Y APLICACIONES"
$Label1.AutoSize=$True
$Label1.Font= New-Object System.Drawing.Font('Microsoft Sans Serif',17)
$Label1.Location=New-Object System.Drawing.Size(120,50)
$Label1.ForeColor = “DarkBlue”

#POWERSHELL
$Label2=New-Object System.Windows.Forms.Label
$Label2.Text="POWERSHELL"
$Label2.AutoSize=$True
$Label2.Font= New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label2.Location=New-Object System.Drawing.Size(100,140)
$Label2.ForeColor = “DarkBlue”

#Microsoft Management Console
$Label3=New-Object System.Windows.Forms.Label
$Label3.Text="Microsoft Management Console"
$Label3.AutoSize=$True
$Label3.Font= New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label3.Location=New-Object System.Drawing.Size(260,140)
$Label3.ForeColor = “DarkBlue”

#Cisco Packet Tracer Student
$Label4=New-Object System.Windows.Forms.Label
$Label4.Text="Cisco Packet Tracer Student"
$Label4.AutoSize=$True
$Label4.Font= New-Object System.Drawing.Font('Microsoft Sans Serif',10)
$Label4.Location=New-Object System.Drawing.Size(480,140)
$Label4.ForeColor = “DarkBlue”


 
#Caja de texto
$TextBox = New-Object System.Windows.Forms.TextBox
$TextBox.Location = New-Object System.Drawing.Size(100,400)
$TextBox.Size = New-Object System.Drawing.Size(260,20)
 


 #########################
 ##      BOTONES        ##
 #########################



#Botón POWERSHELL
$Button3=New-Object System.Windows.Forms.Button
$Button3.Size=New-Object System.Drawing.Size(75,23)
$Button3.Text="ABRIR"
$Button3.Location=New-Object System.Drawing.Size(100,170)
$Button3.BackColor =”LightGray”

#Botón1 Microsoft Management Console
$Button4=New-Object System.Windows.Forms.Button
$Button4.Size=New-Object System.Drawing.Size(75,23)
$Button4.Text="ABRIR"
$Button4.Location=New-Object System.Drawing.Size(260,170)
$Button4.BackColor =”LightGray”

#Botón1 Cisco Packet Tracer Student
$Button5=New-Object System.Windows.Forms.Button
$Button5.Size=New-Object System.Drawing.Size(75,23)
$Button5.Text="ABRIR"
$Button5.Location=New-Object System.Drawing.Size(480,170)
$Button5.BackColor =”LightGray”

#Botón OK
$Button1=New-Object System.Windows.Forms.Button
$Button1.Size=New-Object System.Drawing.Size(75,23)
$Button1.Text="Botón OK"
$Button1.Location=New-Object System.Drawing.Size(120,600)
$Button1.BackColor =”LightGray”
 
#Botón Cancelar
$Button2=New-Object System.Windows.Forms.Button
$Button2.Size=New-Object System.Drawing.Size(75,23)
$Button2.Text="Botón Cancelar"
$Button2.Location=New-Object System.Drawing.Size(220,600)
$Button2.BackColor =”LightGray”
 



#Funcionalidad para el formulario:
#Pulsar la tecla Enter almacena en una variable el contenido de la caja de texto y se muestra
#Pulsar la tecla Escape sale del formulario
$Form.KeyPreview = $True
$Form.Add_KeyDown({if ($_.KeyCode -eq "Enter"){$Var=$TextBox.Text;Write-Host $Var;$Form.Close()}})
$Form.Add_KeyDown({if ($_.KeyCode -eq "Escape"){$Form.Close()}})


############################## 
#Funcionalidad para el botón:#
##############################


#Pulsar Enter almacena en una variable el contenido de la caja de texto y se muestra
#Pulsar Escape sale del formulario
$Button1.Add_Click({$Var=$TextBox.Text;Write-Host $Var})
$Button2.Add_Click({$Form.Close()})

#BOTONES DE PROGRAMAS Y APLICACIONES
$Button3.Add_Click({PowerShell_Ise.exe})
$Button4.Add_Click({C:\Users\HP\OneDrive\Escritorio\Consola1.msc})
$Button5.Add_Click({start-process 'C:\Users\HP\OneDrive\Escritorio\Cisco Packet Tracer Student.lnk'})
 
#Añadir etiqueta
$Form.Controls.Add($Label)
$Form.Controls.Add($Label1)
$Form.Controls.Add($Label2)
$Form.Controls.Add($Label3)
$Form.Controls.Add($Label4)


 
#Añadir botones
$Form.Controls.Add($Button1)
$Form.Controls.Add($Button2)
$Form.Controls.Add($Button3)
$Form.Controls.Add($Button4)
$Form.Controls.Add($Button5)
 
#Añadir caja de texto
$Form.Controls.Add($TextBox)
 
$Form.ShowDialog()