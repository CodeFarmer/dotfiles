#! /usr/bin/env bash

for i in `find $1 -name \*.jar` ; do jar tf $i | grep -q $2 && echo $i ; done

