# Define the wallpaper style you want to set
$wallpaperStyle = 10

# 0 = centered
# 1 = tiled
# 2 = Stretched
# 3 = fit
# 4 = fill
# 5 = span (dual monitors only)

# Define the registry paths for the current user
$regPath = "HKCU:\Control Panel\Desktop"
$wallpaperStyleKey = "WallpaperStyle"
$tileWallpaperKey = "TileWallpaper"

# Set the wallpaper style
Set-ItemProperty -Path $regPath -Name $wallpaperStyleKey -Value $wallpaperStyle

# Adjust the TileWallpaper setting based on the style
# 0 = no tiling (for all styles except 1)
# 1 = tiling (for style 1 only)
if ($wallpaperStyle -eq 1) {
    Set-ItemProperty -Path $regPath -Name $tileWallpaperKey -Value "1"
} else {
    Set-ItemProperty -Path $regPath -Name $tileWallpaperKey -Value "0"
}

# Optional: Refresh the desktop to apply the changes
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
