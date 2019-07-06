#!/bin/sh

set -u
set -e

# Remove unwanted directories
rm -rf ${TARGET_DIR}/var/logs
rm -rf ${TARGET_DIR}/usr/htdocs
rm -rf ${TARGET_DIR}/etc/php-fpm.d

# Link nextcloud binary to /usr/bin
ln -sf /var/www/app/occ ${TARGET_DIR}/usr/bin/occ

# Link cloudbox-cli binary to /usr/bin
ln -sf /opt/cloudbox-cli/bin/cloudbox ${TARGET_DIR}/usr/bin/cloudbox
