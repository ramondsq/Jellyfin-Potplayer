Add-Type -AssemblyName "System.Web"
$path = $args[0] -replace "potplayer://", ""
$path = [System.Web.HttpUtility]::UrlDecode($path)
# 将开头的 X/ 替换为 X:/
$path = $path -replace "^([A-Za-z])/", '$1:/'
echo $path
& "C:\\Program Files\\DAUM\\PotPlayer\\PotPlayerMini64.exe" $path
