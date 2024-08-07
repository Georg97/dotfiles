entries="⇠ Logout\n⏾ Sleep\n⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries | wofi --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    hyprctl dispatch exit
    ;;
  sleep)
    systemctl suspend
    ;;
  reboot)
    systemctl reboot
    ;;
  shutdown)
    systemctl poweroff
    ;;
esac
