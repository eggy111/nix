#!/usr/bin/env bash

THRESHOLD=90
EXCLUDED_DISKS=$(findmnt -ln --output TARGET)
NTFY_URL="https://ntfy.sh/egg"
NTFY_TITLE="Disk Usage Alert"
NTFY_PRIORITY="warning"

df -h
