$targetFile = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if (Test-Path -Path $targetFile) {
   Remove-Item -Path $targetFile
}

powershell -Command { New-Item -Path "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -ItemType SymbolicLink -Target '.\settings.json' }