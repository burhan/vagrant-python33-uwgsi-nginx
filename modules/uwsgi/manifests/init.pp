group { 'puppet': ensure => 'present' }

class uwsgi {
	$virtualenv = '/var/virtualenv/3.3'
	file { "/home/vagrant/install_uwsgi.sh" :
		ensure => file,
		owner => root,
		group => root,
		mode => 777,
		source => "puppet:///modules/uwsgi/install_uwsgi.sh"
	}

	file { "/etc/init/uwsgi.conf" :
		ensure => file,
		owner => root,
		group => root,
		mode => 0644,
		source => "puppet:///modules/uwsgi/uwsgi.conf"
	}

	exec { "uwsgi_install" :
		command => "/bin/bash /home/vagrant/install_uwsgi.sh $virtualenv",
		require => [Exec['virtualenv_setup'], File['/home/vagrant/install_uwsgi.sh']]
	}

	service { "uwsgi" :
		ensure => running,
		require => Exec['uwsgi_install']
	}
}