group { 'puppet': ensure => 'present' }

class nginx {
	package { "nginx" :
		ensure => present,
		require => Exec['apt-get update']
	}

	service { "nginx" :
		ensure => running,
		require => Package["nginx"]
	}
}