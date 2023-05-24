DESTDIR=
FORTUNES=/usr/share/games/fortunes
DHP_FORTUNE=${FORTUNES}/dhp
GAMES=/usr/games
ICONS=/usr/share/icons
SHORTCUTDIR=/usr/share/applications

PACKAGE=fortune-dhp
VERSION:=$(shell dpkg-parsechangelog -S Version | sed -rne 's,([^-\+]+)+(\+dfsg)*.*,\1,p'i)
UPSTREAM_PACKAGE:=${PACKAGE}_${VERSION}.orig.tar.gz

SRC=./dhp
TEXTS="${SRC}/*-dhp"
DATA="${SRC}/*-dhp.dat"
ICON="dhp-lotus.png"
SHORTCUT="fortune-dhp.desktop"
REMOVEFILE=../fortune-dhp.6x.gz  .debhelper debhelper-build-stamp files fortune-dhp fortune-dhp.substvars
dhp: 
	find "$(SRC)" -type f -iname "*-dhp" -exec strfile {} \;

distclean: clean
clean:
	find . -type f -name '*.dat' -delete
	cd debian; rm -rf ${REMOVEFILE}

remove:
	rm -rf "$(DESTDIR)$(DHP_FORTUNE)"
	rm -rf "$(DESTDIR)$(GAMES)/fortune-dhp"
	rm -rf "$(DESTDIR)${ICONS}/${ICON}"
	rm -rf "$(DESTDIR)${SHORTCUTDIR}/${SHORTCUT}"

install: dhp
	mkdir -p "$(DESTDIR)$(DHP_FORTUNE)"
	mkdir -p "$(DESTDIR)$(GAMES)"
	install -m0755 fortune-dhp "$(DESTDIR)$(GAMES)"
	install -m0644 "$(TEXTS)" "$(DESTDIR)$(DHP_FORTUNE)"
	install -m0644 "$(DATA)"  "$(DESTDIR)$(DHP_FORTUNE)"
	install -m0644 "${ICON}" "$(DESTDIR)${ICONS}"
	install -m0644 "${SHORTCUT}" "$(DESTDIR)${SHORTCUTDIR}"

dpkg:
	tar caf ../${UPSTREAM_PACKAGE} --exclude='debian' --exclude='.git' .
	debuild -S -i -I

deb:
	debuild -b

.PHONY: dhp dpkg deb install clean remove distclean stat all

