group { 'puppet': ensure => 'present' }

class python33::install {
	package { ["python3.3", "python3.3-dev"] :
		ensure => latest,
		require => Exec["apt-get update"]
	}	
}

class python33::packages {
	$virtualenv_path = '/var/virtualenv'
	$virtualenv_version = '3.3'

	file { "/home/vagrant/virtualenv.sh":
		ensure => file,
		owner => root,
		group => root,
		mode => 777,
		source => "puppet:///modules/python33/virtualenv.sh"
	}

	exec { 'virtualenv_setup' :
		command => "/bin/bash /home/vagrant/virtualenv.sh $virtualenv_path $virtualenv_version",
		require => [Package['python3.3'], File['/home/vagrant/virtualenv.sh']]
	}
}

class python33 {
	include python33::install, python33::packages
}