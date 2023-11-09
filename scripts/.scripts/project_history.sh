#!/usr/bin/env zsh

git ls-files --full-name -z | xargs -0 -- stat -c'%Y %n' {} | sort -k1,1nr | cut -d' ' -f2-
