###
# Component rules
###

releaseout: $(OBJPATH_RELEASE) $(BINPATH_RELEASE) $(OUT_RELEASE)

debugout: $(OBJPATH_DEBUG) $(BINPATH_DEBUG) $(OUT_DEBUG)

unittest: $(OBJPATH_UNITTEST) $(OBJPATH_DEBUG) $(BINPATH_UNITTEST) $(OUT_UNITTEST)
	@echo "** Run unit test (debug)" $(OUT_UNITTEST)
	$(OUT_UNITTEST)

.SUFFIXES:
.SUFFIXES:	.c .o

count:
	wc *.c *.h

clean:
	$(RM) $(OBJ_BASE)
	$(RM) $(BIN_BASE)
	$(RM) $(DEPPATH)


.PHONY: all
.PHONY: count
.PHONY: clean

#
# Create directories if necessary
#
.PHONY: objdirs bindirs unittestdirs
objdirs: $(OBJPATH_RELEASE) $(OBJPATH_DEBUG) $(OBJPATH_UNITTEST)
bindirs: objdirs $(BINPATH_RELEASE) $(BINPATH_DEBUG)
unitestdirs: objdirs $(BINPATH_UNITTEST)

$(OBJPATH_RELEASE) $(OBJPATH_DEBUG) $(OBJPATH_UNITTEST) $(BINPATH_RELEASE) $(BINPATH_DEBUG) $(BINPATH_UNITTEST):
	$(MKDIR) $@

#
#rules for compling outfiles
#
$(OUT_DEBUG): $(foreach o,$(OBJECTS),$(OBJPATH_DEBUG)/$(o).o) $(foreach o,$(OUT_OBJECTS),$(OBJPATH_DEBUG)/$(o).o)
	@echo "** Building executable (debug)" $@
	$(LINK) $(LINKFLAGS) $(DEBUGOPT_LINK) -o $@ $^ $(TARGET_LIBS_DEBUG) $(SYSLIBS) $(LIBRARY_DEBUG)

$(OUT_RELEASE): $(foreach o,$(OBJECTS),$(OBJPATH_RELEASE)/$(o).o) $(foreach o,$(OUT_OBJECTS),$(OBJPATH_RELEASE)/$(o).o)
	@echo "** Building executable (release)" $@
	$(LINK) $(LINKFLAGS) $(RELEASEOPT_LINK) -o $@ $^ $(TARGET_LIBS_RELEASE) $(SYSLIBS) $(LIBRARY_RELEASE)

#
#rules for compling unit tests
#
$(OUT_UNITTEST): $(foreach o,$(OBJECTS),$(OBJPATH_DEBUG)/$(o).o) $(foreach o,$(UNITTEST),$(OBJPATH_UNITTEST)/$(o).o)
	@echo "** Building executable (unit test)" $@
	$(LINK) $(LINKFLAGS) $(DEBUGOPT_LINK) -o $@ $^ $(TARGET_LIBS_DEBUG)  $(SYSLIBS) $(LIBRARY_UNITTEST)



#
# Rules for compiling
#
$(OBJPATH_RELEASE)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
	@echo "** Compiling" $< "(release)"
	$(CC) $(INCLUDE) $(CCFLAGS) $(RELEASE_CC) $(STATICOPT_CC) -c $< -o $@

$(OBJPATH_DEBUG)/%.o: $(SRCDIR)/%.c $(DEPPATH)/%.d
	@echo "** Compiling" $< "(debug)"
	$(CC) $(INCLUDE) $(CCFLAGS) $(DEBUGOPT_CC) $(STATICOPT_CC) -c $< -o $@

$(OBJPATH_UNITTEST)/%.o: $(SRCDIR_UNITTEST)/%.c $(DEPPATH)/%.d
	@echo "** Compiling" $< "(unit test)"
	$(CC) $(INCLUDE) $(CCFLAGS) $(DEBUGOPT_CC) $(STATICOPT_CC) -c $< -o $@

#
# Rules for creating dependency information
#
$(DEPPATH)/%.d: $(SRCDIR)/%.c
	@echo "** Creating dependency info for" $^
	$(MKDIR) $(DEPPATH)
	$(DEP) $(SRCDIR)/$(patsubst %.d,%.c,$(notdir $@)) $@ $(OBJPATH_DEBUG) $(OBJPATH_RELEASE) $(INCLUDE) $(CCFLAGS)

$(DEPPATH)/%.d: $(SRCDIR_UNITTEST)/%.c
	@echo "** Creating dependency info for" $^
	$(MKDIR) $(DEPPATH)
	$(DEP) $(SRCDIR_UNITTEST)/$(patsubst %.d,%.c,$(notdir $@)) $@ $(OBJPATH_UNITTEST) $(OBJPATH_UNITTEST) $(INCLUDE) $(CCFLAGS)

depend: $(addprefix $(DEPPATH)/,$(addsuffix .d,$(objects)))
