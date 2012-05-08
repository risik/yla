###
# Common part begin
###

ifndef YLA_BASE_PATH
YLA_BASE_PATH=$(shell pwd)
endif

#
# Define Tools
#
CC      = gcc
CXX     = g++
LINK    = $(CC)
LIB     = ar -cr
RANLIB  = ranlib
STRIP   = strip
DEP     = $(YLA_BASE_PATH)/makedepend.gcc
SHELL   = sh
RM      = rm -rf
CP      = cp
MKDIR   = mkdir -p
SHLIB   = $(CXX) -shared -Wl,-soname,$(notdir $@) -o $@

#
# System Specific Flags
#
SYSFLAGS = -D_XOPEN_SOURCE=500 -D_REENTRANT -D_THREAD_SAFE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE

#
# System Specific Libraries
#
SYSLIBS  = -ldl -lrt


INCFLAGS =
LDFLAGS = -Wl,-rpath,/usr/local/lib

# Compiler and Linker Flags
#
CFLAGS          =
CFLAGS32        =
CFLAGS64        =
CXXFLAGS        = -Wall -Wno-sign-compare
CXXFLAGS32      =
CXXFLAGS64      =
LINKFLAGS       =
LINKFLAGS32     =
LINKFLAGS64     =
STATICOPT_CC    =
STATICOPT_CXX   =
STATICOPT_LINK  = -static
SHAREDOPT_CC    = -fPIC
SHAREDOPT_CXX   = -fPIC
SHAREDOPT_LINK  = -Wl,-rpath,$(LIBPATH)
DEBUGOPT_CC     = -g -D_DEBUG
DEBUGOPT_CXX    = -g -D_DEBUG
DEBUGOPT_LINK   = -g
RELEASEOPT_CC   = -O2 -DNDEBUG
RELEASEOPT_CXX  = -O2 -DNDEBUG
RELEASEOPT_LINK = -O2

#
# System Specific Libraries
#
SYSLIBS  = -lpthread -ldl -lrt


SRCDIR=src
SRCDIR_UNITTEST=testsuite/src
INCLUDE=-Iinclude

DEPPATH = .dep

OBJ_BASE=obj
BIN_BASE=bin

OBJPATH_DEBUG=$(OBJ_BASE)/Debug
OBJPATH_DEBUG_SHARED=$(OBJ_BASE)/DebugShared
BINPATH_DEBUG=$(BIN_BASE)/Debug
LIBSPATH_DEBUG=$(BIN_BASE)/DebugShared
OUTNAME_DEBUG=$(BASENAME)_d
LIB_DEBUG=$(BINPATH_DEBUG)/$(OUTNAME_DEBUG).a
LIBS_DEBUG=$(LIBSPATH_DEBUG)/$(OUTNAME_DEBUG).so
OUT_DEBUG=$(BINPATH_DEBUG)/$(OUTNAME_DEBUG)

OBJPATH_RELEASE=$(OBJ_BASE)/Release
OBJPATH_RELEASE_SHARED=$(OBJ_BASE)/ReleaseShared
BINPATH_RELEASE=$(BIN_BASE)/Release
LIBSPATH_RELEASE=$(BIN_BASE)/ReleaseShared
OUTNAME_RELEASE=$(BASENAME)
LIB_RELEASE=$(BINPATH_RELEASE)/$(OUTNAME_RELEASE).a
LIBS_RELEASE=$(LIBSPATH_RELEASE)/$(OUTNAME_RELEASE).so
OUT_RELEASE=$(BINPATH_RELEASE)/$(OUTNAME_RELEASE)

OBJPATH_UNITTEST=$(OBJ_BASE)/UnitTest
BINPATH_UNITTEST=$(BIN_BASE)/UnitTest
OUTNAME_UNITTEST=$(BASENAME)_t
OUT_UNITTEST=$(BINPATH_UNITTEST)/$(OUTNAME_UNITTEST)

