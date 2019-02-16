#!/bin/sh

set -u
set -e

# Remove unwanted directories
rm -rf ${TARGET_DIR}/var/logs
rm -rf ${TARGET_DIR}/usr/htdocs
rm -rf ${TARGET_DIR}/etc/php-fpm.d
