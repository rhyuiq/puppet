class localusers::groups::wheel {
	group {'wheel':
		ensure => 'present',
		gid => '502',
	}
}
