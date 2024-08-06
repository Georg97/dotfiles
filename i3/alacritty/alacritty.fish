
if test (is_dark) -eq 1
    alacritty --config-file=$HOME/.config/i3/alacritty/alacritty.yml
else
    alacritty --config-file=$HOME/.config/i3/alacritty/alacritty_light.yml
end
