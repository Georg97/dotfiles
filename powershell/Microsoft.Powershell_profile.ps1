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
  function killport {
      param(
          [Parameter(Mandatory)][int]$Port
      )

      $connections = Get-NetTCPConnection -LocalPort $Port -ErrorAction SilentlyContinue

      if (-not $connections) {
          Write-Host "No process found listening on port $Port." -ForegroundColor Yellow
          return
      }

      $processId = ($connections | Select-Object -First 1).OwningProcess
      $process = Get-Process -Id $processId -ErrorAction SilentlyContinue

      if (-not $process) {
          Write-Host "Process $processId owns port $Port but is no longer running." -ForegroundColor Yellow
          return
      }

      Write-Host "Port $Port is used by process $($process.ProcessName) (PID: $processId)." -ForegroundColor Cyan
      Stop-Process -Id $processId -Force
      Write-Host "Killed $($process.ProcessName) (PID: $processId)." -ForegroundColor Green
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

function GoToI18nify {
    cd "$HOME\development\sunbound\mono\shared\service\i18ify";
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


function GoToSynapse {
    cd "$HOME\development\gitea\Synapse";
}
Set-Alias mono GoToMono
Set-Alias monovibe GoToMonoVibe

Set-Alias megan GoToMegan
Set-Alias i18nify GoToI18nify

Set-Alias lora GoToLora
Set-Alias lorabe GoToLoraBackend
Set-Alias loradb GoToLoraDb

Set-Alias synapse GoToSynapse

function grep($str) {
    Select-String -Pattern $str
}

function GoToStartup($str) {
    cd "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup";
}
Set-Alias startup GoToStartup

