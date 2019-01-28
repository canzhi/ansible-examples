#!/usr/bin/env bash
nginxPidNum=`ps -C nginx --no-header | wc -l` 
keepalivedPidNum=`ps -C keepalived --no-header | wc -l`
if [ $nginxPidNum -eq 0 ];then
	/sbin/nginx 
	sleep 1
	nginxPidNum=`ps -C nginx --no-header | wc -l`
	if [ $nginxPidNum -eq 0 ];then
		systemctl stop keepalived
	fi
elif [ $keepalivedPidNum -eq 0 ];then
	systemctl start keepalived
fi

