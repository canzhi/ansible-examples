#!/usr/bin/env bash
FROM_DIR="/nfs_share/"
RSYNC_CMD="rsync -az --delete $FROM_DIR root@192.168.1.32:/nfs_share"
while inotifywait -rqq -e modify,move,create,delete,attrib  $FROM_DIR 
do
	$RSYNC_CMD
done &
