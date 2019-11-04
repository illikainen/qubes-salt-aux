DESTDIR ?= /srv/salt
DIR="aux"
TOP="aux.sls"
SRC=$(TOP) $(shell find $(DIR) -type f)

all:

install:
	@for x in $(SRC); do \
		install -v -D -m 640 "$$x" "$(DESTDIR)/$$x" ; \
	done

uninstall:
	@rm -rfv "$(DESTDIR)/$(DIR)" "$(DESTDIR)/$(TOP)"

reinstall: uninstall install

.PHONY: all install uninstall reinstall
