function ConfigureNeoVim {
    Set-Location $HOME\AppData\Local\nvim
    nvim .
}
function ConfigurePowerShell {
    Set-Location $HOME\Documents\WindowsPowerShell
    nvim .
}
function ConfigureWindowsTerminal {
    Set-Location $HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState
    nvim .
}
function GitLogOneline {
    git log --graph --oneline --decorate
}
function GitLog {
    git log --graph --decorate
}
function RestartKomorebi {
    komorebic stop; komorebic start
}
Set-Alias vimc ConfigureNeoVim
Set-Alias pwshc ConfigurePowerShell
Set-Alias termc ConfigureWindowsTerminal
Set-Alias gitll GitLogOneline
Set-Alias gitl GitLog
Set-Alias lgit lazygit
Set-Alias k kubectl
# Set-Alias kn kubectl config set-context --current --namespace
Set-Alias t talosctl
Set-Alias restart-komorebic RestartKomorebi

# $Env:KOMOREBI_CONFIG_HOME = 'C:\Users\g.hirsch\.config\komorebi'
$env:KUBE_EDITOR="nvim"
$env:KUBECONFIG = "$HOME\.kube\config;$HOME\.kube\sunbound-dev.conf"
$Env:KOMOREBI_CONFIG_HOME="$HOME\.config\komorebi"

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

# new powershell version path
#$pwsh_executable = 'C:\Program Files\PowerShell\7\pwsh.exe'
#if (Test-Path -Path $pwsh_executable) {https://teams.live.com/l/invite/FEABfjCrx-coLP2yQI
#    $pwsh_executable
#}

#$startPath = "$HOME\development"
#if (-not (Test-Path -Path $startPath)) {
#    New-Item -Path $startPath -ItemType Directory
#}
#cd $HOME\development

function StartSolarsyncWorking {
   wt -w 0 split-pane -V -d "$HOME\development\sunbound\solarsync"; k9s; 
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\solarsync"; 
   wt -w 0 focus-pane -t 0; 
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\solarsync"; 
   wt -w 0 focus-pane -t 0;
   cd "$HOME\development\sunbound\solarsync"; lgit;
}
Set-Alias sswork StartSolarsyncWorking