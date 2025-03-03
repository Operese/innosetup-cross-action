#!/bin/bash

set -eEu

# Start a dummy X server with display 0, and run it in the background.
# Waiting 2 seconds is a hack to make sure it is started by the time we run the installer process.
sudo Xdummy :0 > /dev/null 2>&1 &
sleep 2

# Install InnoSetup 6
curl -SL "https://files.jrsoftware.org/is/6/innosetup-6.4.0.exe" -o is.exe
wine is.exe /SP- /VERYSILENT /ALLUSERS /SUPPRESSMSGBOXES /DOWNLOADISCRYPT=1
rm is.exe

winenv() {
    wine cmd /c "echo $1" | tr -d '\r'
}

# Install unofficial languages
PROGFILES_PATH="$(winepath -u "$(winenv %PROGRAMFILES%)")"
cd "$PROGFILES_PATH/Inno Setup 6/Languages"
curl -L "https://api.github.com/repos/jrsoftware/issrc/tarball/is-6_4_0" | tar xz --strip-components=4 --wildcards "*/Files/Languages/Unofficial/*.isl"
