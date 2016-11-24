class filedemo { 

	File {
		owner => 'root',
		group => 'root',
		mode  => '660',
		
	}
	
	$homedir = "/root"
	$content = "MyFile1 Content"
	
	file { "$homedir/myfile1.txt" :
		content => $content,
	
	}

	file { "$homedir/myfile2.txt" :
		content => 'myFile2 content',
		group 	=> root,
		owner	=> admin,

	
	}
	
	file { '/root/motd' :
		ensure 	=> present,
		source	=> 'puppet:///modules/filedemo/motd',
		owner	=> root,
		group	=> root,
		mode	=> '0644',
	
	}

	file { '/etc/motd' :
		ensure	=> link,
		target	=> '/root/motd',
		
	
	}
}
