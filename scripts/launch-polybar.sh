for monitor in $(polybar --list-monitors | cut -d":" -f1); do
	MONITOR=$monitor polybar --reload top &
done
