rm ~\AppData\Local\lazygit\config.yml
powershell -Command { New-Item -Path ~\AppData\Local\lazygit\config.yml -ItemType SymbolicLink -Target '.\config.yml' }
