#!/bin/bash

DOCKERFILES_DIR=`pwd`

for item in `ls $DOCKERFILES_DIR`; do
	cd $DOCKERFILES_DIR/$item
	docker build -t eugene/`basename $(pwd)` .
done
