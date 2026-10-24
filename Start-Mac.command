#!/bin/sh
# Finder may launch this file from a different working directory.
folder=$(CDPATH= cd -P -- "$(dirname -- "$0")" && pwd) || exit 1
emulator="$folder/FX-8000G.html"

if [ ! -f "$emulator" ]; then
    printf '%s\n' 'Could not find FX-8000G.html.' 'Extract the entire ZIP and keep the launcher and HTML file in the same folder.' >&2
    exit 1
fi

if open "$emulator"; then
    exit 0
fi

printf '%s\n' 'Could not open the emulator automatically.' "Open this file in your browser: $emulator" >&2
exit 1
