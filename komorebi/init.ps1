New-Item -Path $Env:KOMOREBI_CONFIG_HOME\komorebi.json -ItemType SymbolicLink -Value '.\komorebi.json'
New-Item -Path $Env:KOMOREBI_CONFIG_HOME\komorebi.ahk -ItemType SymbolicLink -Value '.\komorebi.ahk'
komorebic fetch-asc
