# Dotfiles (supposed) for My Windows Development Environments
<!-- TODO: Clean it up & organize details properly. -->
This directory holds all the scripts, configurations, among other stuff required to setup my development environment on a Windows machine. As of the latest commit, the directory contains configurations for the following software(s) among other stuff like font(s) & so on.

Stuff required for all Software Development needs:

- [Git][Git]
- [Windows Terminal][Windows Terminal] 
- [Neovim][Neovim] 
- [Visual Studio Code][VSCode]
- [Python Programming Language][Python]
- [Google Backup & Sync][Google Backup & Sync]
- [Docker][Docker] (Not installing it for now as it requires better hardware)

Miscellaneous software with no configurations required:

- [Steam][Steam]
- [Transmission Bittorent Client][Transmission]
- [VLC Media Plater][VLC]
- [ShareX][ShareX]
- [Google Backup & Sync][Google Drive]

And fonts:

- [Fira Code Nerd Font][Fira Code Nerd Font]

## Setup Instructions

As of right now, you'll need to install each group of stuff through seperate scripts (_I plan on automating them at some point of time_). So, to install the [Fira Code Nerd Font][Fira Code Nerd Font], execute the `.\Dotfiles\Windows\Install-Font` script.

**DO NOTE:** The `Install-Font.ps1` script is still work-in-progress. **DO NOT use it yet!**

As for the rest of the software, execute the `.\Dotfiles\Windows\Instal-Software` script. You can find more information on what each of those software does.

**DO NOTE:** The `Install-Software.ps1` script is still work-in-progress & is subject to change, but can be used. So, before executing it, its **RECOMMENDED** you read through it first.

### Windows Terminal

The new Windows Terminal from Microsoft is highly customizable. To read more about it, check the article - [Customizing the New Windows Terminal: A Minimalist Approach][Blog Post]. To make your Windows Terminal similar to how it's described in the article, copy the contents of [dotfiles/Windows/Windows Terminal/settings.json][Windows Terminal Config File] to `$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocaState\`.

You can find more information about customizing your Windows Terminal in this article - [Enhance Your Console Experience With Windows Terminal][Reference Article].

### Neovim

While it's possible to use the original `vim` on Windows with `gvim` but [Neovim][Neovim Homepage] is a much better alternative with it's preconfigured sensible configurations. It's usable pretty much out-of-the-box without any need for configuring.

The configurations for my Neovim is available under this path: [dotfiles/Windows/Neovim/init.vim][My Neovim Config File]. At it's current condition it's heavily a WIP file which is why it's void of any content. Regardless of it, rest assured, Neovim is **VERY** usable without any configurations out-of-the-box.

As for where to copy the configuration to. You can copy the contents of my `init.vim` under your `$env:LOCALAPPDATA\nvim\init.vim`. Then ensure to reload `nvim` on your preferred terminal.

### Steam

To satisfy an individual's gaming needs. More information is available at: [store.steampowered.com][Valve Steam].

### Visual Studio Code

The open-source code editor provided by Microsoft. More information is available at: [code.visualstudio.com][VSCode]

### Alacritty

The cross-platform & fastest terminal emulator need it especially for Vim. More information is available at: [github.com/alacritty/alacritty]

### Transmission Bit Torrent Client

A cross-platform & open-source Bittorent client. More information is available at: [transmissionbt.org][Transmission].

### VLC Media Player

VLC Media Player to watch movies & shit. More information is available at: [www.videolan.org][VLC].

### Python Programming Language

The Python programming language for all coding & scripting needs. More information is avaialble at: [www.python.org][Python]

### ShareX

Cross-platform & open-source software for screen capture, file-sharing & productivity tool. More information is available at: [getsharex.com][ShareX]. A more light-weight & simple alternative might be better fit for my use-case.

### Google Backup & Sync

For backing up stuffs to Google Drive from the local drive storage automatically. More information is available at [www.google.com/drive/download][Google Backup & Sync].

### Docker

Installing Docker on Windows 10 can be a bit finicky. For one it appears to be very closely knitted with WSL for smoother operation. But making it work natively requires Hyper-V.
Following are some observations I made to make it work:

- Docker is available on Winget which means it's install can be automated. But
  for one thing, the file size appears to be about 525 mb!
- Hyper-V needs to be enabled. There's a PowerShell command to automate it:
  `Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All`
but it asks for a restart which needs to be confirmed by the user.
- The user confirmation prompt needs to be automated at some point of time.
- More information on enabling Hyper-V is available at: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v

### Git

Installing Git on Windows isn't straight-forward. While there's [Git for Windows][Git for Windows] but it's too bloated for my use case, hence, MinGit is used. But sadly, it doesn't come with all the necessary dependencies either. On top of it, there's no straight way to configure it either. So, following are the detailed steps on how to get it working as soon as possible:

1. Download the zipped file from it's [source repository][MinGit Releases] to the `C:\Tools` directory.
2. Add the directory `C:\Tools\MinGit\cmd` to `$PATH`.
3. There're additional configurations that needs to be made. Some include downloading a few missing dependencies but I'm still researching on what's the best & minimalistic solution to fix them.
4. Copy the configuration files to `$HOME`(same as `%USERPROFILE%` Environment Variable) from the [Git](./Git] directory.
5. Then ensure it works by typing the `git --version` command on the command-line interface.
 
<!-- Reference Links -->
[Windows Terminal]: https://github.com/Jarmos-san/dotfiles/tree/master/Windows/Windows%20Terminal
[Neovim]: https://github.com/Jarmos-san/dotfiles/tree/master/Windows/nvim
[Blog Post]: https:jarmos.netlify.app/customizing-windows-terminal-a-minimalist-approach
[Windows Terminal Config File]: https://github.com/Jarmos-san/dotfiles/tree/master/Windows/Windows%20Terminal/settings.json
[Reference Article]: https://adamtheautomator.com/new-windows-terminal
[Neovim Homepage]: https://adamtheautomator.com/new-windows-terminal
[My Neovim Config File]: https://github.com/Jarmos-san/dotfiles/tree/master/Neovim/init.vim
[Fira Code Nerd Font]: https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FiraCode
[Valve Steam]: https://store.steampowered.com/
[VSCode]: https://code.visualstudio.com/
[Transmission]: https://transmissionbt.com/
[VLC]: https://www.videolan.org/
[Python]: https://www.python.org/
[ShareX]: https://getsharex.com/
[Google Backup & Sync]: https://www.google.com/drive/download/
[Docker]: https://www.docker.com/
