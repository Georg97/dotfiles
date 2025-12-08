function ConfigureDotfiles {
    Set-Location $HOME\.dotfiles
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

Set-Alias confd ConfigureDotfiles
Set-Alias which Get-Command
Set-Alias gitll GitLogOneline
Set-Alias gitl GitLog
Set-Alias lgit lazygit
Set-Alias k kubectl
# Set-Alias kn kubectl config set-context --current --namespace
Set-Alias t talosctl
Set-Alias restart-komorebic RestartKomorebi

# $Env:KOMOREBI_CONFIG_HOME = 'C:\Users\g.hirsch\.config\komorebi'
$env:KUBE_EDITOR="nvim"
$env:KUBECONFIG = "$HOME\.kube\config;$HOME\.kube\sunbound-dev.conf;$HOME\.kube\sunbound-prod.conf"
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


# ----------------------------------------------------------------------------------------------- #
# | ==================================== Workspace Setups ===================================== | #
# ----------------------------------------------------------------------------------------------- #
function StartSolarsyncWorking {
   wt -w 0 split-pane -V -d "$HOME\development\sunbound\mono\product\solarsync";
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono\product\solarsync";
   wt -w 0 focus-pane -t 0; 
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono\product\solarsync"; 
   wt -w 0 focus-pane -t 0;
   cd "$HOME\development\sunbound\mono\product\solarsync"; lgit;
}
function StartSolerpWorking {
   wt -w 0 split-pane -V -d "$HOME\development\sunbound\mono\product\solerp";
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono\product\solerp";
   wt -w 0 focus-pane -t 0; 
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono\product\solerp"; 
   wt -w 0 focus-pane -t 0;
   cd "$HOME\development\sunbound\mono\product\solerp"; lgit;
}
function StartSunCalendarWorking {
   wt -w 0 split-pane -V -d "$HOME\development\gitea\SunCalendar";
   wt -w 0 split-pane -H -d "$HOME\development\gitea\SunCalendar";
   wt -w 0 focus-pane -t 0; 
   wt -w 0 split-pane -H -d "$HOME\development\gitea\SunCalendar"; 
   wt -w 0 focus-pane -t 0;
   cd "$HOME\development\gitea\SunCalendar"; lgit;
}
function StartMonoWorking {
   wt -w 0 split-pane -V -d "$HOME\development\sunbound\mono" make solerp-configapi-local-run;
   Start-Sleep -Seconds 2
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono" make solerp-gql-local-run;
   wt -w 0 focus-pane -t 0; 
   wt -w 0 split-pane -H -d "$HOME\development\sunbound\mono"; make solerp-frontend-local
   wt -w 0 focus-pane -t 0;
   cd "$HOME\development\sunbound\mono"; lgit;
}
Set-Alias sswork StartSolarsyncWorking
Set-Alias sework StartSolerpWorking
Set-Alias scwork StartSunCalendarWorking
Set-Alias monowork StartMonoWorking

# ----------------------------------------------------------------------------------------------- #
# | ==================================== Directory Setups ===================================== | #
# ----------------------------------------------------------------------------------------------- #
function GoToMono {
    cd "$HOME\development\sunbound\mono";
}
function GoToMonoVibe {
    cd "$HOME\development\sunbound\mono - vibe";
}

function GoToMegan {
    cd "$HOME\development\sunbound\mono\product\megan";
}
function GoToMeganDb {
    cd "$HOME\development\sunbound\mono\product\megan\database";
}
function GoToMeganBackend {
    cd "$HOME\development\sunbound\mono\product\megan\backend";
}

function GoToLora {
    cd "$HOME\development\sunbound\mono\product\lora";
}
function GoToLoraDb {
    cd "$HOME\development\sunbound\mono\product\lora\database";
}
function GoToLoraBackend {
    cd "$HOME\development\sunbound\mono\product\lora\backend";
}

function GoToSolarsync {
    cd "$HOME\development\sunbound\mono\product\solarsync";
}
function GoToSolarsyncDb {
    cd "$HOME\development\sunbound\mono\product\solarsync\database";
}
function GoToSolarsyncBackend {
    cd "$HOME\development\sunbound\mono\product\solarsync\backend";
}
Set-Alias mono GoToMono
Set-Alias monovibe GoToMonoVibe

Set-Alias megan GoToMegan
Set-Alias meganbe GoToMeganBackend
Set-Alias megandb GoToMeganDb

Set-Alias solarsync GoToSolarsync
Set-Alias ssyncbe GoToSolarsyncDb
Set-Alias ssyncdb GoToSolarsyncBackend

Set-Alias lora GoToLora
Set-Alias lorabe GoToLoraBackend
Set-Alias loradb GoToLoraDb

function grep($str) {
    Select-String -Pattern $str
}
