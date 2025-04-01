#!/bin/bash
#0--检查修改后的文件名称
#1--修改文件名并移动到G盘
#2--只修改文件名
set -e

read -p "请输入你的操作：0--文件名修改是否正常 1--修改文件名并移动到G盘 2--只修改文件名 q--Quit " OPTION

if [[ "$OPTION" == "q" ]]; then
	echo -e "\033[32m Quit now~~~~\033[0m"
	exit 1
fi
# Check if the first and second parameters are provided
if [ -z "$1" ]; then
  echo "First and second parameters are required."
  exit 1
fi

TARGET_DIR=$1

# xtm.dvd-halfcd2.手机.2010.中国.第05集g
# TARGET_DIR="/d/迅雷下载/漫长的季节"
echo -e "\033[32m in ${TARGET_DIR} will remove these words:\033[0m"
for ((i=3; i<=$#; i++)); do
    echo -e "\033[34m ${!i} \033[0m"
done

# 遍历目标目录下的所有文件
for file in "$TARGET_DIR"/*; do
    new_name=$file

    for ((i=3; i<=$#; i++)); do
        current_param=${!i}
        new_name=${new_name/"$current_param"/}
    done
    
    echo -e "before:$file  \033[33m After:$new_name \033[0m"
    if [ "$OPTION" == 1 ] || [ "$OPTION" == 2 ];then
	mv $file $new_name
    fi
done

if [ "$OPTION" == 1 ];then
    # 移动到G盘
    if [ -d "/g/" ];then
        cp -r  ${TARGET_DIR} /g/
        echo -e "\033[34m 复制完成！ \033[0m"
    else
        echo -e "\033[31m 你没有插入硬盘！ \033[0m"
    fi
else
    echo -e "\033[31m Just check file name is right! \033[0m"
fi

