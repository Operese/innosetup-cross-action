#!/bin/bash

set -eEu

sudo Xdummy :0 > /dev/null 2>&1 &
curl -SL "https://files.jrsoftware.org/is/6/innosetup-6.4.0.exe" -o is.exe
sleep 2
wine is.exe /SP- /VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES /DOWNLOADISCRYPT=1
rm is.exe

winenv() {
    wine cmd /c "echo $1" | tr -d '\r'
}

PROGFILES_PATH="$(winepath -u "$(winenv %PROGRAMFILES%)")"

cd "$PROGFILES_PATH/Inno Setup 6/Languages"
curl -L "https://api.github.com/repos/jrsoftware/issrc/tarball/is-6_4_0" | tar xz --strip-components=4 --wildcards "*/Files/Languages/Unofficial/*.isl"
