echo '----------------------------------------------------------------------------------------------'
echo '                                     _____                                _                   '
echo '    /\                              / ____|                              | |                  '
echo '   /  \     _ __    _ __    ___    | (___     ___    __ _   _ __    ___  | |__     ___   _ __ '
echo '  / /\ \   | ._ \  | ._ \  / __|    \___ \   / _ \  / _` | | .__|  / __| | ._ \   / _ \ | .__|'
echo ' / ____ \  | |_) | | |_) | \__ \    ____) | |  __/ | (_| | | |    | (__  | | | | |  __/ | |   '
echo '/_/    \_\ | .__/  | .__/  |___/   |_____/   \___|  \__,_| |_|     \___| |_| |_|  \___| |_|   '
echo '           | |     | |                                                                        '
echo '           |_|     |_|                                                                        '
echo '----------------------------------------------------------------------------------------------'
echo 'Select an option:'
echo '0. Print all apps installed.'
echo '1. Search an specific app.'
echo '----------------------------------------------------------------------------------------------'
read option

if [ $option -eq 0 ]; then
	aptitude -F' * %p -> %d ' --no-gui --disable-columns search '?and(~i,!?section(libs), !?section(kernel), !?section(devel))'
else
	echo 'Which app would you like to search?'
	read appSearched
	if [[ $appSearched == '' ]]; then
		aptitude -F' * %p -> %d ' --no-gui --disable-columns search '?and(~i,!?section(libs), !?section(kernel), !?section(devel))'
	else
		echo ''
		echo ' ------------------------- Apps Lists  ------------------------- '
		aptitude -F' * %p ' --no-gui --disable-columns search "?and("$appSearched")"
	fi
fi



