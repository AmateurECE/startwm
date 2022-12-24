#!/usr/bin/make -f
###############################################################################
# NAME:		    Makefile
#
# AUTHOR:	    Ethan D. Twardy <ethan.twardy@gmail.com>
#
# DESCRIPTION:	    Makefile for my Apple M1 machine.
#
# CREATED:	    12/24/2022
#
# LAST EDITED:	    12/24/2022
#
####

INSTALL_ARTIFACTS+=$(B)/greetd.toml
INSTALL_ARTIFACTS+=$(B)/profile.sh
INSTALL_ARTIFACTS+=$(B)/environments.conf
INSTALL_ARTIFACTS+=$(B)/sway.conf
INSTALL_ARTIFACTS+=$(B)/gtkgreet.css

all: $(INSTALL_ARTIFACTS)

$(B)/greetd.toml: greetd.toml $(B); cp $< $@
$(B)/profile.sh: profile.sh $(B); cp $< $@
$(B)/environments.conf: environments.conf $(B); cp $< $@
$(B)/sway.conf: sway.conf $(B); cp $< $@
$(B)/gtkgreet.css: gtkgreet.css $(B); cp $< $@

install:
	install -Dm644 greetd.toml \
		"$(DESTDIR)$(datadir)/greetd/greetd.toml"
	install -Dm644 profile.sh \
		"$(DESTDIR)/etc/profile.d/startwm.sh"; \
	install -Dm644 environments.conf \
		"$(DESTDIR)/etc/greetd/environments"
	install -Dm644 sway.conf "$(DESTDIR)/etc/greetd/sway-config"
	install -Dm644 gtkgreet.css "$(DESTDIR)/etc/greetd/gtkgreet.css"

###############################################################################
