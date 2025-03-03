#!/bin/sh

set -eEu

escone() {
    printf %s\\n "$1" | sed "s/'/'\\\\''/g;1s/^/'/;\$s/\$/' \\\\/"
}

winpaths() {
    for arg; do
        if [ -e "$arg" ]; then
            escone "$(winepath -w "$arg")"
        else
            escone "$arg"
        fi
    done
    echo " "
}

winenv() {
    wine cmd /c "echo $1" | tr -d '\r'
}

PROGFILES_PATH="$(winepath -u "$(winenv %PROGRAMFILES%)")"
INNO_BIN="Inno Setup 6/ISCC.exe"
INNO_PATH="${PROGFILES_PATH}/${INNO_BIN}"

# Convert all input paths to Windows-style paths so InnoSetup can parse them
eval set -- "$(winpaths "$@")"

# Run InnoSetup with the given arguments
exec wine "$INNO_PATH" "$@"
