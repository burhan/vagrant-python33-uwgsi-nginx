group { 'puppet': ensure => 'present' }
Exec { path => ['/usr/local/bin', '/opt/local/bin', '/usr/bin', '/usr/sbin', '/bin', '/sbin'] }

class system {
	exec { 'apt-get update':
	    command => '/usr/bin/apt-get update'
	}

	$corepackages = ["nfs-common", "memcached", "sendmail", "git", "curl"]
	package { $corepackages :
    ensure => latest,
    require => Exec["apt-get update"]
  }
}

include system
include nginx
include python33
include uwsgi