class base::ssh {
	package { 'openssh-package' :
		name	=> 'open-ssh',
		ensure	=> present,
		
	}

	file { '/etc/ssh/sshd_config' :
		ensure	=> file,
		owner	=> root,
		group	=> root,
		require	=> Package['openssh-package'],
		source	=> 'puppet:///modules/base/sshd_config',
	}

	service { 'ssh' :
		ensure		=> running,
		enable		=> true,
		subscribe	=> File['/etc/ssh/sshd_config'],

	}
}
