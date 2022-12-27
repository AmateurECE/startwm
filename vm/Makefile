#!/usr/bin/make -f
###############################################################################
# NAME:		    Makefile
#
# AUTHOR:	    Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:	    Makefile for the virtual machine configuration
#
# CREATED:	    12/24/2022
#
# LAST EDITED:	    12/27/2022
#
####

all: $(B)/greetd.toml $(B)/profile.sh

$(B)/greetd.toml: greetd.toml $(B); cp $< $@
$(B)/greetd.conf: greetd.conf $(B); cp $< $@
$(B)/profile.sh: profile.sh $(B); cp $< $@

install:
	install -Dm644 greetd.toml \
		"$(DESTDIR)$(datadir)/greetd/greetd.toml"
	install -Dm644 profile.sh \
		"$(DESTDIR)/etc/profile.d/startwm.sh"; \
	install -Dm644 $(B)/greetd.conf \
		"$(DESTDIR)$(systemd_unitdir)/greetd.service.d/greetd.conf"

###############################################################################
