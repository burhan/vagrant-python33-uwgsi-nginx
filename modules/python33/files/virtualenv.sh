#!/bin/bash
#
# $1 - Virtualenv path
# $2 - Python version

VENV_LOCAL_BIN="$1/$2/local/bin"
VENV_BIN="$1/$2/bin"

# Create the virtualenv if it doesn't exist
mkdir -p $1
if [ ! -d $1/$2 ]; then
	ln -s /usr/bin/pyvenv-$2 /usr/bin/pyvenv
	pyvenv $1/$2

	# Download distribute
	wget http://python-distribute.org/distribute_setup.py -O /tmp/distribute_setup.py

	# Activate the virtualenv and install easy_install and pip
	source $VENV_BIN/activate
	$VENV_BIN/python /tmp/distribute_setup.py
	ln -s $VENV_LOCAL_BIN/easy_install $VENV_BIN/easy_install
	easy_install pip
	ln -s $VENV_LOCAL_BIN/pip $VENV_BIN/pip
fi

exit