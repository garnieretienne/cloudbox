#!/bin/sh

set -u
set -e

# Remove unwanted directories
rm -rf ${TARGET_DIR}/var/logs
rm -rf ${TARGET_DIR}/usr/htdocs
rm -rf ${TARGET_DIR}/etc/php-fpm.d

# Add data volumes to fstab
grep -qx '/dev/sda' foo.bar ||
    echo "/dev/sda\t/mnt\t\tbtrfs\tdefaults\t0\t0" >> ${TARGET_DIR}/etc/fstab

# Link nextcloud binary to /usr/bin
ln -sf /var/www/app/occ ${TARGET_DIR}/usr/bin/occ

# Link cloudbox-cli binary to /usr/bin
ln -sf /opt/cloudbox-cli/bin/cloudbox ${TARGET_DIR}/usr/bin/cloudbox

# Enable the setup app vhost
ln -sf /etc/apache2/vhosts/available/setup.conf \
    ${TARGET_DIR}/etc/apache2/vhosts/enabled/main.conf
