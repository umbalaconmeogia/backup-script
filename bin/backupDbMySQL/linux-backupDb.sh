#!/bin/sh

# Root directory (parent of $BACKUP_DIR)
ROOT_PATH=../
# Use yyyymmdd_HHiiss as container backup directory.
CONTAINER_DIR=`date "+%Y%m%d_%H%M%S"`
# Database name.
DB_NAME=db_name
# backup directory name.
BACKUP_DIR=backup
BACKUP_PATH=$ROOT_PATH/$BACKUP_DIR

# Copy mysql
mysqldump --defaults-file=$BACKUP_PATH/my.cnf $DB_NAME > ${DB_NAME}_${CONTAINER_DIR}.sql
