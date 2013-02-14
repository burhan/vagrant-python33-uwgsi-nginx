#!/bin/bash
#
# $1 - Virtualenv path

# Activate the virtualenv
source $1/bin/activate

# Install uWSGI
pip install uwsgi
ln -s $1/local/bin/uwsgi /usr/bin/uwsgi

# Setup required folders
mkdir -p /etc/uwsgi/apps-enabled
mkdir -p /var/log/uwsgi

exit