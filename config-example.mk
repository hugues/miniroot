# Main targets
TARGETS = linux_uImage

# Host compilation

# Target compilation
CROSS_ARCH = arm
CROSS_PATH = /home/me/toolchain-arm-uclibc
CROSS_PREFIX = arm-linux-uclibc-
CROSS_CC = 'ccache $(CROSS_PATH)/bin/$(CROSS_PREFIX)gcc'

# Linux
LINUX_CONFIG = arm_defconfig

# Root filesystem

# Busybox

# Packages
PKG_DROPBEAR_SERVER = yes
