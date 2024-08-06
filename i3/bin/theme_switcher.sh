#!/bin/bash

# Execute the command and capture its output
output=$(grep -Po '(?<=gtk-application-prefer-dark-theme=).*' $HOME/.config/gtk-4.0/settings.ini)

# Check the output value and execute corresponding commands
if [ "$output" = "1" ]; then
    sed -i '/^\[Settings\]$/,/^\[/ s/^gtk-application-prefer-dark-theme=1/gtk-application-prefer-dark-theme=0/' $HOME/.config/gtk-4.0/settings.ini
    # Command A
elif [ "$output" = "0" ]; then
    sed -i '/^\[Settings\]$/,/^\[/ s/^gtk-application-prefer-dark-theme=0/gtk-application-prefer-dark-theme=1/' $HOME/.config/gtk-4.0/settings.ini
    # Command B
else
    echo "Unknown output value. No command executed."
fi

