#!/bin/bash
echo "-- Start"

channels=( "BRIDGEHD" "BRIDGETV" "DANGETV" "RUSONGTV" "TOPSONG" )

# Для каждого канала
for channel in ${channels[@]}
do
	echo " "
	bad_path="${PWD}/${channel}_UTF16" # Отсюда
	good_path="${PWD}/${channel}" # Сюда
	echo $channel
	
	error_flag=0
	
	# Для каждого файла
	for file in $(ls $bad_path)
	do
		echo $bad_path/$file
		
		cmd="/bin/uconv $bad_path/$file -f utf-16 -t utf-8 -o $good_path/$file"
		$cmd # Выполнение
		
		if [ $? -eq 0 ]; then
			echo $(date -u) ";OK;${cmd}" >> convert.log
		else
			echo $(date -u) ";FAIL;${cmd}" >> convert.log
			error_flag=1
		fi
		
	done
	
	# Если не было ошибок -- файлы в старой кодировке больше не нужны
	if [ $error_flag -eq 0 ]; then
		/bin/rm $bad_path/*.log
	fi
		
done


echo " "
echo "-- End"
#EOF
