PKG_BUILD_DIR = $(BUILD_DIR)

.PHONY: packages packages_clean
clean: packages_clean

define PKG_IS_SET
$(strip $(or \
	$(findstring y, $1), \
	$(findstring Y, $1), \
))
endef

define PKG_INCLUDE_RULE
ifneq '$(call PKG_IS_SET, $1)' ''
packages: $2
packages_clean: $2_clean
endif
endef

ZLIB_DIR = $(PKG_DIR)/zlib
include $(ZLIB_DIR)/zlib.mk

DROPBEAR_DIR = $(PKG_DIR)/dropbear
include $(DROPBEAR_DIR)/dropbear.mk

E2FSPROGS_DIR = $(PKG_DIR)/e2fsprogs
include $(E2FSPROGS_DIR)/e2fsprogs.mk

LIBROXML_DIR = $(PKG_DIR)/libroxml
include $(LIBROXML_DIR)/libroxml.mk

NATIVEGCC_DIR = $(PKG_DIR)/native-gcc
include $(NATIVEGCC_DIR)/native-gcc.mk

