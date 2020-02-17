INSTALL_TARGET_PROCESSES = SpringBoard
TARGET = iPhone:clang:13.0:13.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = timex
$(TWEAK_NAME)_FRAMEWORKS = UIKit

timex_FILES = Tweak.x
timex_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
ARCHS = arm64 arm64e
