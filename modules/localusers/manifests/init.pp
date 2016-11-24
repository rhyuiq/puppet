class localusers {
   user { 'admin':
        ensure     => present,
	shell      => '/bin/bash',
	home       => '/home/admin',
	gid    	   => 'wheel',
	managehome => true,
	}

   user { 'krishna':
	ensure		=> present,
	shell		=> '/bin/bash',
	home		=> '/home/krishna',
	groups		=> ['wheel', 'finance'],
	managehome 	=> true,
	}   
}

