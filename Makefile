#!/usr/bin/make -f
###############################################################################
# NAME:		    Makefile
#
# AUTHOR:	    Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:	    Build script for the package.
#
# CREATED:	    11/30/2022
#
# LAST EDITED:	    11/30/2022
###

B=build

all: m1

$(B): ; mkdir -p $@
$(B)/greetd.conf: greetd.conf $(B); cp $< $@
$(B)/startwm.sh: startwm.sh $(B); cp $< $@

INSTALL_ARTIFACTS += $(B)/greetd.toml
INSTALL_ARTIFACTS += $(B)/greetd.conf
INSTALL_ARTIFACTS += $(B)/startwm.sh
INSTALL_ARTIFACTS += $(B)/profile.sh

m1: $(B)/m1.lock
vm: $(B)/vm.lock

$(B)/m1.lock: $(B)/greetd.conf $(B)/startwm.sh
	: # Building for Apple M1 Hardware
	cp m1/greetd.toml $(B)
	cp m1/profile.sh $(B)
	touch $@

$(B)/vm.lock: $(B)/greetd.conf $(B)/startwm.sh
	: # Building for a virtual machine
	cp vm/greetd.toml $(B)
	cp vm/profile.sh $(B)
	touch $@

datadir=/usr/share
systemd_unitdir=/usr/lib/systemd/system

install: $(INSTALL_ARTIFACTS)
	: # Installing sources
	install -Dm644 $(B)/greetd.conf \
		"$(DESTDIR)$(systemd_unitdir)/greetd.service.d/greetd.conf"
	install -Dm644 $(B)/greetd.toml \
		"$(DESTDIR)$(datadir)/greetd/greetd.toml"
	install -Dm644 $(B)/profile.sh "$(DESTDIR)/etc/profile.d/startwm.sh"
	install -Dm755 $(B)/startwm.sh "$(DESTDIR)/usr/bin/startwm"

clean:
	rm -rf $(B)

###############################################################################
