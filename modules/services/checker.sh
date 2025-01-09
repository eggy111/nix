#!/usr/bin/env bash

THRESHOLD=90
EXCLUDED_DISKS=$(findmnt -ln --output TARGET)
