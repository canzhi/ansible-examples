#!/usr/bin/env bash
nfsPidNum=`ps -C nfsd --no-header | wc -l`
keepalivedPidNum=`ps -C keepalived --no-header | wc -l`
if [ $nfsPidNum -eq 0 ];then
	systemctl start nfs
	sleep 1
	nfsPidNum=`ps -C nfsd --no-header | wc -l`
	if [ $nfsPidNum -eq 0 ];then
		systemctl stop keepalived
	fi
elif [ $keepalivedPidNum -eq 0 ];then
	systemctl start keepalived
fi
