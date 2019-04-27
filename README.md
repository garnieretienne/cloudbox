# Complete the installation

Generate SSL certificates:
`sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/apache2/server.key -out /etc/apache2/server.crt`

Configure nextcloud:
`occ maintenance:install --database mysql --database-host 127.0.0.1 --database-port 3306 --database-name nextcloud --database-user root --database-pass "" --admin-user root --admin-pass root`

Set `cloudbox.local` as a trusted domain:
`occ config:system:set trusted_domains 0 --value cloudbox.local`

Convert columns in database to big int:
`occ --quiet db:convert-filecache-bigint`

Configure the redis service:
`occ config:system:set redis host --value '127.0.0.1' && occ config:system:set redis port --value '6379'`

Enable Redis for local caching;
`occ config:system:set memcache.local --value '\OC\Memcache\Redis'`

Enable Redis file locking:
`occ config:system:set memcache.locking --value '\OC\Memcache\Redis'`

