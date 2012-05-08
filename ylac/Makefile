ifndef YLA_BASE_PATH
YLA_BASE_PATH=$(shell pwd)/..
endif

include $(YLA_BASE_PATH)/defines.mk

#
# Modules to build
#
OBJECTS = \
    yla_parser \
    yla_lexer \
    yla_main

LIBRARY += -L/usr/local/lib
LIBRARY_RELEASE = $(LIBRARY)
LIBRARY_DEBUG = $(LIBRARY)

DEBUGOPT_CC += "-D _SYNDEBUG"

BASENAME=ylac

all: release debug

release: releaseout

debug: debugout

test: debug
	echo LEXER Test
	$(OUT_DEBUG) < test/lexer_test.txt
	echo PARSER Test
	$(OUT_DEBUG) < test/parser_test.txt

$(SRCDIR)/yla_lexer.c: $(SRCDIR)/yla_lexer.ll
	$(LEX) -o $@ $^

$(SRCDIR)/yla_parser.c $(SRCDIR)/token.h: $(SRCDIR)/yla_parser.yy
	$(YACC) -o $@ --defines=$(SRCDIR)/token.h $^

include $(YLA_BASE_PATH)/rules.mk
