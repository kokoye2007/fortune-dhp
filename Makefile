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
	mkdir -p "$(FORTUNES)"
	mkdir -p "$(GAMES)"
	install -m0755  fortune-dhp "$(GAMES)"
	install -m0644  "$(TEXTS)" "$(FORTUNES)"
	install -m0644  "$(DATA)"  "$(FORTUNES)"
	install -m0644  "${ICON}" "${ICONS}"
.PHONY: dhp install clean distclean stat all
