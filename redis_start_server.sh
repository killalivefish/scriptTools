#!/bin/bash

echo -e '\033[32m======START REDIS SERVER=====\033[0m'

#nohup /d/myWorkSpace/develop/installPackage/redis-5.0.4/bin/redis-server 2>&1 &
systemctl start redis

systemctl status redis.service

if [ $? == 0 ];then
	echo -e '\033[32m======start success=====\033[0m'
else
	echo -e '\033[31m======strt failed!!=====\033[0m'
fi
