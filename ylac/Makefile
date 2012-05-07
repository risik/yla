ifndef YLA_BASE_PATH
YLA_BASE_PATH=$(shell pwd)/..
endif

include $(YLA_BASE_PATH)/defines.mk

#
# Modules to build
#
OBJECTS = \
    yla_main

LIBRARY += -L/usr/local/lib
LIBRARY_RELEASE = $(LIBRARY)
LIBRARY_DEBUG = $(LIBRARY)

BASENAME=ylac

all: release debug

release: releaseout

debug: debugout

include $(YLA_BASE_PATH)/rules.mk
