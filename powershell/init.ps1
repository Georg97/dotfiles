powershell -Command { New-Item -Path $PROFILE -ItemType SymbolicLink -Target '.\Microsoft.Powershell_profile.ps1' }
powershell -Command { New-Item -Path $(pwsh -Command { $PROFILE }) -ItemType SymbolicLink -Target '.\Microsoft.Powershell_profile.ps1' }
