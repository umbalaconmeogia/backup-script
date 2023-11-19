#!/bin/sh

# Root directory (parent of $BACKUP_DIR and $SOURCE_DIR)
ROOT_PATH=/home/thanh/web/com.nashiari.dev/201405.roll_call
# Default config
PATH=/usr/local/sbin:/usr/bin:/bin
# Use yyyymmdd_HHiiss as container backup directory.
CONTAINER_DIR=`date "+%Y%m%d_%H%M%S"`
# Database name.
DB_NAME=roll_call
# backup directory name.
BACKUP_DIR=backup
# Source directory name.
SOURCE_DIR=roll_call
BACKUP_PATH=$ROOT_PATH/$BACKUP_DIR
CONTAINER_PATH=$BACKUP_PATH/$CONTAINER_DIR

# Copy mysql
mysqldump --defaults-file=$BACKUP_PATH/my.cnf $DB_NAME > ${DB_NAME}_${CONTAINER_DIR}.sql