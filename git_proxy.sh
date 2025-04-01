#!/bin/bash
#切换git代理

echo -e '\033[32m======SWITCH Git Proxy=====\033[0m'

case $1 in
on)
    git config --global remote.origin.proxy '127.0.0.1:7890'
;;
off)
    git config --global --unset remote.origin.proxy
;;
status)
     git config --get remote.origin.proxy
;;
*)
  echo -e '\033[32mUsage:$0 {on|off|status}\033[0m'
esac
exit 0