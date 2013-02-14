# Vagrant Python 3.3 Development Box

This vagrant creates a new Python 3.3 virtualenv located in `/var/virtualenv/3.3` and installs easy_install and pip into that virtualenv. You can then reference the virtualenv in your vassals for uWSGI.

## Customizing

Within *Vagrantfile* change `config.vm.share_folder` to reflect whichever path you wish to share.
Once the box is up and running, `vagrant ssh` in and symlink the vassals for uWSGI to /etc/uwsgi/apps-enabled and restart uWSGI with `service uwsgi restart`. You will also want to symlink any required vhosts to `/etc/nginx/sites-enabled` and reload nginx with `service nginx restart`

## Included Applications

* Python 3.3
* Nginx
* uWSGI
* Memcached

## Python Additions

1. easy_install
2. pip

# Usage

`vagrant up`, wait for the box to be initialized and then navigate to *192.168.33.10* in your browser.