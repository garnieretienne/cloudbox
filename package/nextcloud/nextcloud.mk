################################################################################
#
# nextcloud
#
################################################################################

NEXTCLOUD_VERSION = 15.0.4
NEXTCLOUD_SOURCE = nextcloud-$(NEXTCLOUD_VERSION).zip
NEXTCLOUD_SITE = https://download.nextcloud.com/server/releases

define NEXTCLOUD_EXTRACT_CMDS
	unzip $(NEXTCLOUD_DL_DIR)/$(NEXTCLOUD_SOURCE) -d $(@D)
endef

define NEXTCLOUD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/var/www/app
	cp -r $(@D)/nextcloud/* $(TARGET_DIR)/var/www/app
	cp -r $(@D)/nextcloud/.[^.]* $(TARGET_DIR)/var/www/app
endef

define NEXTCLOUD_PERMISSIONS
	/var/www/app  r  755  app  app   -  -  -  -  -
endef

$(eval $(generic-package))

