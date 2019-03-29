################################################################################
#
# php-redis
#
################################################################################

PHP_REDIS_VERSION = 4.2.0
PHP_REDIS_SOURCE = redis-$(PHP_REDIS_VERSION).tgz
PHP_REDIS_SITE = https://pecl.php.net/get
PHP_REDIS_CONF_OPTS = --with-php-config=$(STAGING_DIR)/usr/bin/php-config
PHP_REDIS_DEPENDENCIES = php host-autoconf

# phpize does the autoconf magic
define PHP_REDIS_PHPIZE
	(cd $(@D); \
		PHP_AUTOCONF=$(HOST_DIR)/bin/autoconf \
		PHP_AUTOHEADER=$(HOST_DIR)/bin/autoheader \
		$(STAGING_DIR)/usr/bin/phpize)
endef

PHP_REDIS_PRE_CONFIGURE_HOOKS += PHP_REDIS_PHPIZE

$(eval $(autotools-package))
