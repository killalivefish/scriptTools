#!/bin/bash

NACOS_HOME=/d/myWorkSpace/develop/nacos

if [ $# -ne 1 ];then
	echo -e '\033[31mUsage: $0 {start|stop}\033[0m'
	exit 1
fi

case $1 in
start)
	echo -e '\033[32mStarting Nacos...\033[0m'
	$NACOS_HOME/bin/startup.cmd -m standalone
	;;
stop)
	echo -e '\033[32mStopping Nacos...\033[0m'
	$NACOS_HOME/bin/shutdown.cmd
	;;
*)
	echo -e '\033[31mUsage: {start|stop}\033[0m'
	exit 1
	;;
esac