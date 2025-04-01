#!/bin/bash
# 常用操作

web_path=/d/myWorkSpace/web_project
script_path=/d/myWorkSpace/shell/script
config_file=/d/myWorkSpace/githubCode/shell/properties/main_config.properties
log_file=/d/myWorkSpace/shell/log/xxx.log
html_template_file=/d/myWorkSpace/shell/template/template.html
shell_template_file=/d/myWorkSpace/shell/template/template.sh

#软件路径
VSCODE="/d/myWorkSpace/develop/vscode/Microsoft VS Code/Code.exe"

function Creat_Html_File() {
	echo -n 'Enter a HTML file name: '
    read name
	
	if [ ! -f ${web_path}/${name}.html ]
	then
		cp ${html_template_file} ${web_path}/${name}.html
		#echo -e '<!DOCTYPE html>\n<html lang="en">\n\n<head>\n\t<meta charset="UTF-8">\n\t<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\t<title>temp</title>\n\t<style>\n\t</style>\n</head>\n\n<body>\n</body>\n\n</html>' >  ${web_path}/${name}.html
	    echo 'html file creat done!'
	    ls -l ${web_path}/${name}*.html
		echo 'Open in VScode, plaease wait....'
		$("$VSCODE" ${web_path}/${name}.html)
	else
		temp_name=${name}_$(date +%y%m%d%H%M%S).html
		cp ${html_template_file}  ${web_path}/${temp_name}
		#echo -e '<!DOCTYPE html>\n<html lang="en">\n\n<head>\n\t<meta charset="UTF-8">\n\t<meta name="viewport" content="width=device-width, initial-scale=1.0">\n\t<title>temp</title>\n\t<style>\n\t</style>\n</head>\n\n<body>\n</body>\n\n</html>' >  ${web_path}/temp_name
		echo 'html file exits, has add a timestamp end of file!'
		ls -l ${web_path}/${name}*
	fi
}

function Creat_Bash_File() {
	echo -n 'Enter a Shell file name: '
    read name
	
	if [ ! -f ${script_path}/${name}.sh ]
	then
		cp ${shell_template_file} ${script_path}/${name}.sh
		#echo -e '#!/bin/bash\n#\n' > ${script_path}/${name}.sh
	    echo 'shell file creat done!'
	    ls -l ${script_path}/${name}*
		echo 'Open in VScode, plaease wait....'
		$("$VSCODE" ${script_path}/${name}.sh)
	else
		temp_name=${name}_$(date +%y%m%d%H%M%S).sh
		cp ${shell_template_file} ${script_path}/${temp_name}.sh
		#echo -e '#!/bin/bash\n#\n' > ${script_path}/${temp_name}
		echo 'shell file exits, please input a unique name!'
		ls -l ${script_path}/${name}*
	fi
}

function Creat_GitIgnore_File() {
	echo -n 'Enter a project path: '
    read name
	#check project is exit
	if [ ! -f ${project_path}/.gitignore ]
	then
		touch ${project_path}/.gitignore
		echo -e '.gitnore\ntarget/\n.idea\n*.iml' > ${project_path}/.gitignore
	    echo 'gitignore file creat done!'
	    ls -l ${project_path}/.gitignore
	fi
}

function Find_Book() {
	echo -n 'Enter a book name: '
    read name
	#echo `find /d/myWorkSpace/book -name "*${name}*"`
	ls -ltr /d/myWorkSpace/book/*${name}*
}

function Init_My_Work_Space() {
	# exit
	exit
	if [ -z $config_file ];then
		echo 'please input a right config file'
		exit 1
	elif [ -f $config_file ];then
		source $config_file
		Create_Folder ${work_home_path}/${main_path}
		Create_Folder ${work_home_path}/${main_path}/${java_path}
		Create_Folder ${work_home_path}/${main_path}/${python_path}
		Create_Folder ${work_home_path}/${main_path}/${web_path}
		Create_Folder ${work_home_path}/${main_path}/${andrio_path}
		Create_Folder ${work_home_path}/${main_path}/${shell_path}
		Create_Folder ${work_home_path}/${main_path}/${shell_path}/${shell_scriopt}
		Create_Folder ${work_home_path}/${main_path}/${shell_path}/${shell_properties}
		Create_Folder ${work_home_path}/${main_path}/${shell_path}/${shell_log}
		Create_Folder ${work_home_path}/${main_path}/${github}
		Create_Folder ${work_home_path}/${main_path}/${devlop_tool}
		Create_Folder ${work_home_path}/${main_path}/${book_path}
		Create_Folder ${work_home_path}/${main_path}/${my_blog}
		echo 'work space init done'
	else
		echo 'config file not exist'
		exit 1
	fi
}

function Create_Folder() {
	if [ ! -d ${1} ];then
		mkdir ${1}
	else
		log "${1} is exiting, please input a anthoer folder path"
	fi
}

function log() {
	printf "`date '+%a %d %b %G:%M:%S %Z'` ${1}\n" >> ${log_file}
}

function menu {
	clear
	echo '#############start##############'
	echo -e '1.creat a html file'
	echo -e '2.creat a shell file'
	echo -e '3.creat a gitignore file'
	echo -e '4.find book'
	echo -e '5.init my work space'
	echo -e 'b.back to mnu'
	echo -e 'q.exit'
	echo '#############start##############'
	echo -en 'Enter your option:'

	read -n 1 option
}

menu

case ${option} in
	1)
		clear
		Creat_Html_File ;;
	2)
		clear
		Creat_Bash_File ;;
	3)
		clear
		Creat_GitIgnore_File ;;
	4)
		clear
		Find_Book ;;
	5)
		clear
		Init_My_Work_Space ;;
	b)
		menu ;;
	q)
		exit ;;
	*)
		clear
		echo 'error funck you do not suibian input';;
esac
