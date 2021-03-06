# options can be set in config.mk
HOST_CC ?= gcc
#CROSS_ARCH =
#CROSS_PATH =
#CROSS_PREFIX =
#CROSS_CC =
#CROSS_CXX =

TOOLCHAIN_BUILD_DIR = $(BUILD_DIR)/$(CROSS_PREFIX:-=)
TOOLCHAIN_CC = $(TOOLCHAIN_BUILD_DIR)/bin/$(CROSS_PREFIX)cc

ifeq '$(CROSS_PATH)' ''
ifneq '$(CROSS_PREFIX)' ''
tools: $(TOOLCHAIN_CC)
CROSS_PATH = $(TOOLCHAIN_BUILD_DIR)
endif
endif

$(TOOLCHAIN_CC):
	@ echo '=== TOOLCHAIN ==='
	@ echo 'NOT YET IMPLEMENTED'
	@ echo 'should use crosstool-ng'
	@ false
