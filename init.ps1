Push-Location .\powershell
powershell -Command { .\init.ps1 }
Pop-Location

Push-Location .\komorebi
powershell -Command { .\init.ps1 }
Pop-Location

powershell -Command { New-Item -Path $HOME\AppData\Local\nvim -ItemType SymbolicLink -Value .\nvim\from-scratch }
#powershell -Command { .\windows-terminal\init.ps1 }
#powershell -Command { .\alacritty\init.ps1 }
#powershell -Command { .\helix\init.ps1 }
