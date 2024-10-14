ln -s $(pwd)/nvim/from-scratch ~/.config/nvim
ln -s $(pwd)/hypr ~/.config/hypr
ln -s $(pwd)/wofi ~/.config/wofi
ln -s $(pwd)/git/.gitconfig ~/.gitconfig
ln -s $(pwd)/lazygit ~/.config/lazygit

rm ~/.zshrc
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
ln -s $(pwd)/zsh/themes/gtheme.zsh-theme ~/.oh-my-zsh/themes/gtheme.zsh-theme
