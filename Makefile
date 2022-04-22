DESTDIR=
FORTUNES=/usr/share/games/fortunes
GAMES=/usr/games
ICONS=/usr/share/icons
SRC=./dhp
TEXTS="${SRC}/*-dhp"
DATA="${SRC}/*-dhp.dat"
ICON=dhp-lotus.png

dhp: 
	find "$(SRC)" -type f -iname "*-dhp" -exec strfile {} \;

distclean: clean
clean:
	find . -type f -name '*.dat' -delete

install: dhp
	mkdir -p "$(DESTDIR)$(FORTUNES)"
	mkdir -p "$(DESTDIR)$(GAMES)"
	install -m0755  fortune-dhp "$(DESTDIR)$(GAMES)"
	install -m0644  "$(TEXTS)" "$(DESTDIR)$(FORTUNES)"
	install -m0644  "$(DATA)"  "$(DESTDIR)$(FORTUNES)"
	install -m0644  "${ICON}" "$(DESTDIR)${ICONS}"
.PHONY: dhp install clean distclean stat all
