#!/bin/bash
set -e

echo -e "\033[32m=====add a new alias===== \033[0m"

echo -e "\033[32minput a alias annotation: \033[0m"
read annotation

echo -e "\033[32minput a alias name: \033[0m"
read name

echo -e "\033[32minput a alias: \033[0m"
read newCommand

if [ "$name" = "" ] || [ "$newCommand" = "" ];then
    echo -e "\033[31mname and command can not be empty!\033[0m"
    exit 1
fi

aliasShellPath=/d/myWorkSpace/develop/git/Git/etc/profile.d
aliasShell=aliases.sh

echo -e "\033[32m=====backup aliases.sh=====\033[0m"
time=`date +%Y%m%d%H%M%S`
cp ${aliasShellPath}/${aliasShell} ${aliasShellPath}/${aliasShell}_bak_${time}
ls -l ${aliasShellPath}/${aliasShell}*

echo -e "\033[32m=====add command=====\033[0m"
if [ "$annotation" = "" ];then
    sed -i "8a alias ${name}='${newCommand}'" ${aliasShellPath}/${aliasShell}
    sed -n '9p' ${aliasShellPath}/${aliasShell}
else
    sed -i "8a #${annotation}" ${aliasShellPath}/${aliasShell}
    sed -i "9a alias ${name}='${newCommand}'" ${aliasShellPath}/${aliasShell}
    sed -n '9p' ${aliasShellPath}/${aliasShell}
    sed -n '10p' ${aliasShellPath}/${aliasShell}
fi

echo -e "\033[32m=====END===== \033[0m"
