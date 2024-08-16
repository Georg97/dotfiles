Push-Location .\powershell
powershell -Command { .\init.ps1 }
Pop-Location

Push-Location .\komorebi
powershell -Command { .\init.ps1 }
Pop-Location

powershell -Command { New-Item -Path $HOME\AppData\Local\nvim -ItemType SymbolicLink -Value .\nvim\from-scratch }

Push-Location .\alacritty
powershell -Command { .\init.ps1 }
Pop-Location

Push-Location .\lazygit
powershell -Command { .\init.ps1 }
Pop-Location

Push-Location .\git
powershell -Command { .\init.ps1 }
Pop-Location
#powershell -Command { .\windows-terminal\init.ps1 }
#powershell -Command { .\helix\init.ps1 }
