ifndef YLA_BASE_PATH
YLA_BASE_PATH=$(shell pwd)/..
endif

include $(YLA_BASE_PATH)/defines.mk

#
# Modules to build
#
OBJECTS = \
    yla_main \
    yla_lexer

LIBRARY += -L/usr/local/lib
LIBRARY_RELEASE = $(LIBRARY)
LIBRARY_DEBUG = $(LIBRARY)

DEBUGOPT_CC += "-D _SYNDEBUG"

BASENAME=ylac

all: release debug

release: releaseout

debug: debugout

test: debug
	$(OUT_DEBUG) < test/lexer_test.txt

$(SRCDIR)/yla_lexer.c: $(SRCDIR)/yla_lexer.ll
	$(LEX) -o $@ $^

include $(YLA_BASE_PATH)/rules.mk
