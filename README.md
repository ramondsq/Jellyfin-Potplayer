# Jellyfin-Potplayer

Tested with Jellyfin 10.9.10 (docker) and Windows 11 (Chromium browser). Newer version is not promised to work with this script. If you have any problem, please open an issue and I'll try my best to help you.

## Installation

1. Download this repository.
2. Put `potplayer.ps1` somewhere else on your disk (DO NOT delete it even after you finish this tutorial). Edit the Potplayer path in `potplayer.ps1`. Notice that you should use double backslash for divider.
3. Edit `potplayer.reg`. Change the path to where you put `potplayer.ps1`. Use double backslash also.
4. Double click `potplayer.reg` and click yes. **(Execute it again if you updated the Potplayer)**
5. Install the extension called `Tampermonkey` in your browser.
6. Edit `userscript.js`.
    1. Change `localhost:8096` to the host of your Jellyfin server.
    2. This step is tricky... We need to make sure that the path to video showed in your Jellyfin webpage is corresponding to the actual place on your computer. So, if you are using this script on the same computer which runs the Jellyfin server, just skip to step 4. If not, please right click on blank area of "This computer" window and choose "add a network location" (or something like it, I use Chinese for the system so I don't know). Link the drive where you put all the videos on your Jellyfin server to a local drive. For example, after the setup, you should be able to open (for the server) `D:/folder1/video1.mp4` by (on your local computer) `Z:/folder1/video1.mp4`. **(this is for the case that you run the Windows Jellyfin server)**
    3.  **If you run the Jellyfin server on Windows**, change line 16 in the script. Firstly, uncomment the line by deleting the leading double backslash. Then change `D:` to the drive on your server to the drive on your local computer. If you have some experience on Javascript, your can custom this path processing script by your own. Just make sure the path will be same to your local file path. For the example mentioned in step 2, the script should be like: `path = path.replace('D:', 'Z:');`
    4. **If you run the Jellyfin server on Linux, macOS or docker**, the path for the server should start with a slash `/`. You may have to change line 15 to someting like `let path = r.Path.replace('/media1', 'X:');` (this may require some knowledge of JavaScript) to match the path on your local Windows PC. 
    5. Choose "Add a new script" in the `Tampermonkey` menu. Copy and paste the whole script. Make sure you enabled the script and when you open Jellyfin, the script is enabled.
7. Test by clicking on the play button! It should work fine now. Enjoy your movies!

## How it works

A user script modifies the play buttons in Jellyfin so that the web player will not be called. Instead, a link will be opened and it's a "url protocol" for Potplayer. The url protocol will firstly call a powershell script and then pass the video path to Potplayer. That's it!

## FAQ

### The browser succeed to bring up the PowerShell script but PotPlayer won't start
This is related to Powershell Execution Policy, please see https://github.com/tccoin/Jellyfin-Potplayer/issues/5 for solution.

### Additional backslash at the end of the path in PotPlayer
See solution in https://github.com/tccoin/Jellyfin-Potplayer/issues/11 (the issue is in Chinese).
