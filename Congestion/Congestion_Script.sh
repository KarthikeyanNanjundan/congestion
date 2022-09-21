#!/bin/bash
sysfs_path="/sys/class/mmc_host/mmc1/device"


DSN1="G070VM1191661SKL"
PCAddr1="192.168.50.10"
Bandwidth1="20m"

DSN2="G070VM1191661SM1"
PCAddr2="192.168.52.10"
Bandwidth2="20m"

DSN3="G070VM1191661SNU"
PCAddr3="192.168.51.10"
Bandwidth3="20m"

sudo ufw disable
sleep 2
echo "Ubuntu Firewall Disabled"

echo "Press q to close all terminal"


gnome-terminal --tab --command="bash -c 'iperf -s -i1 -w 512k -u; $SHELL'"
sleep 2
gnome-terminal --tab --command="bash -c 'adb -s $DSN1 shell iperf -c $PCAddr1 -i1 -w 512k -b $Bandwidth1 -u -t 10000; $SHELL'"
sleep 2

gnome-terminal --tab --command="bash -c 'iperf -s -i1 -w 512k -u; $SHELL'"
sleep 2
gnome-terminal --tab --command="bash -c 'adb -s $DSN2 shell iperf -c $PCAddr2 -i1 -w 512k -b $Bandwidth2 -u -t 10000; $SHELL'"
sleep 2

gnome-terminal --tab --command="bash -c 'iperf -s -i1 -w 512k -u; $SHELL'"
sleep 2
gnome-terminal --tab --command="bash -c 'adb -s $DSN3 shell iperf -c $PCAddr3 -i1 -w 512k -b $Bandwidth3 -u -t 10000; $SHELL'"


while [ 1 -eq 1 ]
do
read  input
	if [ "$input" = "q" ]; then
		echo "Closing all terminals"
		sleep 2
		sudo kill `ps -e | grep -i gnome-terminal | cut -f 1 -d " "`
		exit
	fi
done
