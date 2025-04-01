#!/bin/bash

#cd `dirname $0`/../target
#target_dir=`pwd`

pid=`ps ax | grep -i 'redis-server' | grep -v grep | awk '{print $1}'`
if [ -z "$pid" ] ; then
        echo "No redis server running."
        exit -1;
fi

echo "The redis server (${pid}) is running..."

kill ${pid}

echo "Send shutdown request to redis server(${pid}) OK"
