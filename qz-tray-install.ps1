# Asegúrate de ejecutar como administrador

# Define las rutas de instalación
$oldVersion = "2.0.6"
$newVersion = "2.2.4"
$installerUrl = "https://github.com/heurze/QZ_install_Script/raw/859c04b12b74316ee4f845b53c0220d066ef2157/qz-tray-2.2.4-x86_64.exe"
$installerPath = "$env:Temp\qz-tray-2.2.4-x86_64.exe"

# Elimina la versión anterior (2.0.6) de QZ Tray
$oldAppName = "QZ Tray $oldVersion"
$oldAppPath = Get-Package | Where-Object {$_.Name -like "*$oldAppName*"} | Format-Table -AutoSize

if ($oldAppPath) {
    Write-Host "Desinstalando $oldAppName..."
    Uninstall-Package -Name $oldAppName -Provider "Programs" -Force
    Write-Host "Desinstalación completada."
} else {
    Write-Host "$oldAppName no encontrado. Continuando con la instalación de la nueva versión."
}

# Descarga el instalador de la nueva versión (2.2.4)
Write-Host "Descargando QZ Tray $newVersion..."
Invoke-WebRequest -Uri $installerUrl -OutFile $installerPath

# Instala la nueva versión (2.2.4)
Write-Host "Instalando QZ Tray $newVersion..."
Start-Process -FilePath $installerPath -ArgumentList "/S" -Wait

# Limpia el archivo de instalación temporal
Remove-Item -Path $installerPath

Write-Host "Instalación de QZ Tray $newVersion completada."
