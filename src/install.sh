#!/bin/sh

PREFIX=${PREFIX-"/usr/local"}

### Databases
FORTUNES=$(find dhp -maxdepth 1 -type f | sed "s?dhp/??")
if [ -d custom ] ; then
  FORTUNESMORE=$(find custom -maxdepth 1 -type f | sed "s?custom/??")
else
  FORTUNESMORE=""
fi


DOC="README.md AUTHORS"
DOCDIR=$PREFIX/${DOCDIR:-"doc/fortune-dhp"}
BINDIR=$PREFIX/${BINDIR:-"games"}
MANDIR=$PREFIX/${MANDIR:-"man/man6"}
FORTUNEDIR=${FORTUNEDIR:-"$PREFIX/games"}

FORTUNESDIR=$PREFIX/${FORTUNESDIR:-"share/games/fortunes"}
INSTDIR=$FORTUNESDIR/dhp
SCRIPTSEARCH=${SCRIPTSEARCH:-"$FORTUNESDIR"}

ICONS=$PREFIX/${ICONS:-"share/icons"}
SHORTCUTDIR=$PREFIX/${SHORTCUTDIR:-"share/applications"}

FORTUNEDHP="fortune-dhp"
ICON="dhp-lotus.png"
SHORTCUT="fortune-dhp.desktop"

str_it (){
  dat=$(basename "$1")
  cp -a -f "$1" "$INSTDIR"
  ln -s "$dat" "$INSTDIR"/"$dat".u8
  strfile -s "$INSTDIR"/"$dat"
}

if [ -d "$DOCDIR" ] || mkdir -p "$DOCDIR"
then cp -a -f "$DOC" "$DOCDIR"
else 
 echo "Unable to create $DOCDIR."
 exit 2
fi

if [ -d "$INSTDIR" ] || mkdir -p "$INSTDIR"
then
 for dhp_data in $FORTUNES
 do
  str_it dhp/"$dhp_data"
 done
 for custom_data in $FORTUNESMORE
 do
  str_it custom/"$custom_data"
 done

else
  echo "Unable to create $FORTUNESDIR."
  exit 3
fi

if [ -d "$BINDIR" ] || mkdir -p "$BINDIR"
then
  install -m0755 "$FORTUNEDHP" "$BINDIR"
else
  echo "Unable to create $BINDIR."
  exit 3
fi

if [ -d "$MANDIR" ] || mkdir -p "$MANDIR"
then
  gzip -c "$FORTUNEDHP".6 > "$FORTUNEDHP".6.gz
  install -m0644 "$FORTUNEDHP".6.gz "$MANDIR"
else
  echo "Unable to create $MANDIR."
  exit 3
fi

if [ -d "$ICONS" ] || mkdir -p "$ICONS"
then
  cp -av $ICON "$ICONS"/$ICON
else
  echo "Unable to create $ICONS."
  exit 3
fi

if [ -d "$SHORTCUTDIR" ] || mkdir -p "$SHORTCUTDIR"
then
  cp -av $SHORTCUT "$SHORTCUTDIR"/$SHORTCUT
else
  echo "Unable to create $SHORTCUTDIR."
  exit 3
fi
