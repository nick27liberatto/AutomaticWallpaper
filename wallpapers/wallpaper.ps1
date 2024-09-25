Set-ExecutionPolicy Unrestricted -Scope CurrentUser

$number = Get-Random -Maximum 3
$imgPath="$env:USERPROFILE\Desktop\wallpapers\$($number).jpg"

$code = @' 
using System.Runtime.InteropServices; 
namespace Win32{ 
    
     public class Wallpaper{ 
        [DllImport("user32.dll", CharSet=CharSet.Auto)] 
         static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ; 
         
         public static void SetWallpaper(string thePath){ 
            SystemParametersInfo(20,0,thePath,3); 
         }
    }
 } 
'@
add-type $code 

[Win32.Wallpaper]::SetWallpaper($imgPath)

<#

$wallpaperStyle = 10
$regPath = "HKCU:\Control Panel\Desktop"
$wallpaperStyleKey = "WallpaperStyle"
$tileWallpaperKey = "TileWallpaper"

Set-ItemProperty -Path $regPath -Name $wallpaperStyleKey -Value $wallpaperStyle

if ($wallpaperStyle -eq 1) {
    Set-ItemProperty -Path $regPath -Name $tileWallpaperKey -Value "1"
} else {
    Set-ItemProperty -Path $regPath -Name $tileWallpaperKey -Value "0"
}

RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

#>