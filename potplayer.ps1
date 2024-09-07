Add-Type -AssemblyName "System.Web"
$path = $args[0] -replace "potplayer://", ""
$path = [System.Web.HttpUtility]::UrlDecode($path)
echo $path
& "C:\\Program Files\\DAUM\\PotPlayer\\PotPlayerMini64.exe" $path
