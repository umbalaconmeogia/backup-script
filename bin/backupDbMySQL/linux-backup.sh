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
# Source directory name.
SOURCE_DIR=roll_call
BACKUP_PATH=$ROOT_PATH/$BACKUP_DIR
CONTAINER_PATH=$BACKUP_PATH/$CONTAINER_DIR

# Create backup directory.
mkdir $CONTAINER_PATH
# Copy mysql
mysqldump --defaults-file=$BACKUP_PATH/my.cnf $DB_NAME > $CONTAINER_PATH/${DB_NAME}.sql
# Copy app
cp -pR $ROOT_PATH/$SOURCE_DIR $CONTAINER_PATH/
# Compress
tar czf $BACKUP_PATH/${CONTAINER_DIR}.tar.gz -C $BACKUP_PATH $CONTAINER_DIR
# Delete backup directory
rm -fr $CONTAINER_PATH