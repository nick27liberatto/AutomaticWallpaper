## Functionalities

- Change wallpaper and image style through registry;
- Randomize the wallpapers;
- Define image style to Fill;
- Reload the desktop.

---

## Motivation

The motivation for this program was that when I logged out and back in on my work computer, it would pull a script that I could not modify, and change the image style and wallpaper to an unattractive one. Therefore, I created this script that automatically changes my wallpaper for me.

---

## How to use

0. Open Powershell as Administrator and insert ```Unblock-File -Path $env:USERPROFILE\THE\PATH\FOR\EACH\SCRIPT```;
1. Place the folder in a local that you wouldn't change;
2. Change the path value at the "wallpaper.ps1" script to where you put the folder;
3. Open Task Scheduler;
4. Create a new task to execute "execute-vbs.vbs".

---

## How to Customize the images

You can add new images or change the current ones, but need to pay attention in some things:

- The script only works with .png extension;
- You need to increment the value of the "-maximum" property in the "$number" variable to the quantity of wallpapers you added in the folder;
- The wallpapers names must be number under the maximum value of the "$number" variable;
- The wallpapers can't have the same number.

---

## Improvements

There are some improvements that could be made, but due to the limited time I have available to work on this project, I will simply list the ones I have noticed here:

- Add ```Get-ChildItem``` to automatically get the quantity of wallpapers in the folder;
- Add compatibility to more extensions;
- Compact the scripts deleting desnecessary ones;
- Maybe increment another method to randomize the images.
