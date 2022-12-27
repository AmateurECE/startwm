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
# LAST EDITED:	    12/27/2022
###

export B:=$(shell pwd)/build
export DESTDIR

all: m1

$(B): ; mkdir -p $@
$(B)/startwm.sh: startwm.sh $(B); cp $< $@

m1: $(B)/m1.lock
vm: $(B)/vm.lock

$(B)/m1.lock: $(B)/startwm.sh
	: # Building for Apple M1 Hardware
	cp m1/Makefile $(B)
	$(MAKE) -C m1
	touch $@

$(B)/vm.lock: $(B)/startwm.sh
	: # Building for a virtual machine
	cp vm/Makefile $(B)
	$(MAKE) -C vm
	touch $@

export datadir=/usr/share
export systemd_unitdir=/usr/lib/systemd/system

install: $(INSTALL_ARTIFACTS)
	: # Installing sources
	install -Dm755 $(B)/startwm.sh "$(DESTDIR)/usr/bin/startwm"
	$(MAKE) -C $(B) install

clean:
	rm -rf $(B)

###############################################################################
