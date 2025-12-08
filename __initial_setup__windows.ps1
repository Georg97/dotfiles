# install manually (to keep windows things simple)
# - git
# - notepad++
# - 7zip
# - vscode
# - filelight
# - imagmagick
# - winscp
# - discord

# [optional]
# - gimp
# - inkscape
# - vncviewer

winget install `
    Microsoft.PowerToys `
    Microsoft.Powershell `
    Brave.Brave `
    Obsidian.Obsidian `
    OpenWhisperSystems.Signal `
    Nextcloud.NextcloudDesktop `
    Proton.ProtonVPN `
    Proton.ProtonMail `
    Proton.ProtonDrive `
    --source winget

# also think about:
#   Erlang.ErlangOTP `

scoop bucket add extras
scoop install `
    main/ffmpeg `
    main/gcc `
    main/ghostscript `
    main/helm `
    main/jq `
    main/k9s `
    main/kind `
    main/kubectl `
    main/make `
    main/neovim `
    main/opentofu `
    main/talosctl `
    main/terragrunt `
    extras/audacity `
    extras/insomnia `
    extras/lazygit `
    extras/komorebi `
    extras/whkd `
    extras/autohotkey `

# git clone https://github.com/Georg97/dotfiles $HOME\.dotfiles
# cd $HOME\.dotfiles
# powershell .\init.ps1

# ------------------ [POSTINSTALL] ------------------
# - add git bin folder to path
# - add vscode profiles
#
