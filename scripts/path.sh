#!/usr/bin/env bash
# Script from rwx.gg
# This script takes the content from the $PATH environment variable and replaces every : with a newline character.
# the // is actually a syntax for search and replace, similiar to s/123/456/g in sed and vim

echo -e ${PATH//:/\\n}
