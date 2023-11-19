#!/bin/sh

# Root directory (parent of $BACKUP_DIR and $SOURCE_DIR)
ROOT_PATH=/home/admin/web/201405.roll_call
# Default config
PATH=/usr/local/sbin:/usr/bin:/bin
# Use yyyymmdd_HHiiss as container backup directory.
CONTAINER_DIR=`date "+%Y%m%d_%H%M%S"`
# Database name.
DB_NAME=roll_call
# backup directory name.
BACKUP_DIR=backup
BACKUP_PATH=$ROOT_PATH/$BACKUP_DIR
FILES=$BACKUP_PATH/`date -d "-1 month" +%Y%m%d`_*.zip

rm $FILES
