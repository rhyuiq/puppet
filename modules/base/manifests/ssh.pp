class base::ssh {
	case $osfamily {
		'RedHat' : {$ssh_name='sshd'}
		'Debian' : {$ssh_name='ssh'}
		'default' : {notice('OS not supported by puppet module')}
	}

	package { 'openssh-package' :
		name	=> 'openssh-server',
		ensure	=> present,
		
	}

	file { '/etc/ssh/sshd_config' :
		ensure	=> file,
		owner	=> root,
		group	=> root,
		require	=> Package['openssh-package'],
		source	=> 'puppet:///modules/base/sshd_config',
		notify 	=> Service['ssh-service'],
	}

	service { 'ssh-service' :
		name		=> $ssh_name,
		ensure		=> running,
		enable		=> true,
		subscribe	=> File['/etc/ssh/sshd_config'],

	}
}
