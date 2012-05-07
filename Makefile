all: ylac

clean: clean_ylac

build: clean all

ylac: debug_ylac release_ylac

release_ylac:
	cd ylac; $(MAKE) release

debug_ylac:
	cd ylac; $(MAKE) debug

unittest_ylac:
	cd ylac; $(MAKE) unittest

clean_ylac:
	cd ylac; $(MAKE) clean
