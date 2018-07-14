#!/bin/bash

# Run this from macOS with ssh set up

goaccess="/usr/local/bin/goaccess"
command -v $goaccess >/dev/null 2>&1 || { echo >&2 "I require $goaccess but it's not installed"; exit 1; }

# ssh carbon 'journalctl -u nginx.service -f -o cat' | goaccess -
ssh sunday "sudo tail -f /var/log/nginx/access.log" | $goaccess - 
