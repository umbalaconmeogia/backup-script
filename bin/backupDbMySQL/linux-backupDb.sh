#!/bin/sh

# Root directory (parent of $BACKUP_DIR)
ROOT_PATH=../
# Use yyyymmdd_HHiiss as container backup directory.
CONTAINER_DIR=`date "+%Y%m%d_%H%M%S"`
# Database name.
DB_NAME=dtminternal_salesplandev
# backup directory name.
BACKUP_DIR=backup
BACKUP_PATH=$ROOT_PATH/$BACKUP_DIR
CONTAINER_PATH=$BACKUP_PATH/$CONTAINER_DIR

# Create backup directory.
mkdir $CONTAINER_PATH
# Copy mysql
mysqldump --defaults-file=$BACKUP_PATH/my.cnf $DB_NAME > $CONTAINER_PATH/${DB_NAME}.sql
# Copy app
# cp -pR $ROOT_PATH/$SOURCE_DIR $CONTAINER_PATH/
cd $BACKUP_PATH
zip -r ${CONTAINER_DIR}.zip $CONTAINER_DIR
# Delete backup directory
rm -fr $CONTAINER_PATH
