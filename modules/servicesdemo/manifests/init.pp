class servicesdemo {
	case $osfamily {
		'RedHat' : {
			$ssh_name = 'sshd'
		}
		'Debian' : {
			$ssh_name = 'ssh'
		}
		default : {
			notice('OS Family does not match')
		}
	}


	service { 'resource-name' :
		name	=> $ssh_name,
		ensure	=> running,
		enable	=> true,
	}
} 
