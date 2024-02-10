#script para eliminar archivos mas antiguos que el 01/01/2019

Get-ChildItem -Recurse "Z:\Logs Servicios\*.*"  | foreach { 
$x = $_.LastWriteTime.ToShortDateString()
$hoy = (Get-Date)
$dias = New-TimeSpan -Start $x -End $hoy
$fechadias = $dias.Days

if ($fechadias -gt 900){
    Remove-Item $_.FullName
    echo $_.FullName
    }

}