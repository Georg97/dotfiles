mkdir ~\AppData\Roaming\alacritty
powershell -Command { New-Item -Path ~\AppData\Roaming\alacritty\alacritty.toml -ItemType SymbolicLink -Target '.\alacritty.toml' }
