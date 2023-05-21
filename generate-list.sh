#!/usr/bin/bash

find packages -type f | awk -F'/' '{print $2}' | awk -F'.' '{print $1}' > package-list