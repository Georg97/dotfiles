# install manually (to keep windows things simple)
# - git
# - notepad++
# - 7zip
# - vscode
# - filelight
# - imagmagick
# - winscp
# - discord
# - bibisco (über lemonsqueezy: https://app.lemonsqueezy.com/my-orders/login)
# - chillicream nitro
# - outlook (PWA)

# [optional]
# - gimp
# - inkscape
# - vncviewer

# Requires: PowerShell 5+ (or 7+)
# Purpose: Ensure required commands are available before continuing.

$ErrorActionPreference = 'Stop'

$required = @('scoop', 'winget', 'git')
$missing = @()

foreach ($cmd in $required) {
  if (-not (Get-Command $cmd -ErrorAction SilentlyContinue)) {
    $missing += $cmd
  }
}

if ($missing.Count -gt 0) {
  Write-Error ("Missing required command(s): {0}. Please install them and re-run the script." -f ($missing -join ', '))
  exit 1
}

# All checks passed; continue script below.

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
    ONLYOFFICE.DesktopEditors `
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
