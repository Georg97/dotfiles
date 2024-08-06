PIDs=$(pgrep i3status)
echo $PIDs
for PID in $PIDs
do
    kill -s USR1 $PID
done
